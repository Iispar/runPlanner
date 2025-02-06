import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:run_planner/core/models/plan_type.dart';
import 'package:run_planner/core/models/run.dart';
import 'package:run_planner/core/models/run_week.dart';

class PlanController {
  final storage = Hive.box("storage");

  RxList<Plan> plans;

  PlanController() : plans = <Plan>[].obs {
    plans.value = (storage.get('plans') as List<dynamic>?)
            ?.map((e) => e as Plan)
            .toList() ??
        [];
  }

  int getUpcomingPlansCount() {
    DateTime today = DateTime.now();
    return plans.where((plan) => plan.startDate.isAfter(today)).length;
  }

  int getCompletedPlansCount() {
    DateTime today = DateTime.now();
    return plans.where((plan) => plan.raceDate.isBefore(today)).length;
  }

  List<Plan> getNextThreePlans() {
    DateTime today = DateTime.now();
    List<Plan> sortedPlans = plans
        .where((Plan plan) => plan.raceDate.isAfter(today))
        .toList()
      ..sort((a, b) => a.raceDate.compareTo(b.raceDate));

    return sortedPlans.take(3).toList();
  }

  void addPlan(Plan plan) {
    plan.calculateTotalMileage();
    plans.add(plan);
    storage.put('plans', plans.toList());
  }

  void markAsActive(int id, bool value) {
    for (var plan in plans) {
      if (plan.active == true) {
        plan.active = false;
      } else if (plan.id == id) {
        plan.active = value;
      }
    }

    storage.put('plans', plans.toList());
  }

  bool checkIfAnyPlans() {
    return plans.isEmpty ? false : true;
  }

  void deletePlan(id) {
    plans.value = plans.where((plan) => plan.id != id).toList();

    storage.put('plans', plans.toList());
  }

  void updateRunweek(int id, RunWeek week) {
    plans.map((plan) => {
          if (plan.id == id) {plan.runWeeks[week.weekNumber] = week}
        });

    storage.put('plans', plans.toList());
  }

  int getId() {
    if (plans.isEmpty) return 0;
    return plans[plans.length - 1].id + 1;
  }

  double getCompletedDistanceForWeek(RunWeek week) {
    double sum = 0;
    if (week.monday.completed) sum += week.monday.getFullDistance();
    if (week.tuesday.completed) sum += week.tuesday.getFullDistance();
    if (week.wednesday.completed) sum += week.wednesday.getFullDistance();
    if (week.thursday.completed) sum += week.thursday.getFullDistance();
    if (week.friday.completed) sum += week.friday.getFullDistance();
    if (week.saturday.completed) sum += week.saturday.getFullDistance();
    if (week.sunday.completed) sum += week.sunday.getFullDistance();

    return sum;
  }

  double getDistanceForWeek(RunWeek week) {
    double sum = 0;
    if (!week.monday.completed) sum += week.monday.getFullDistance();
    if (!week.tuesday.completed) sum += week.tuesday.getFullDistance();
    if (!week.wednesday.completed) sum += week.wednesday.getFullDistance();
    if (!week.thursday.completed) sum += week.thursday.getFullDistance();
    if (!week.friday.completed) sum += week.friday.getFullDistance();
    if (!week.saturday.completed) sum += week.saturday.getFullDistance();
    if (!week.sunday.completed) sum += week.sunday.getFullDistance();

    return sum;
  }

  double getDistanceForWeekAllData(RunWeek week) {
    double sum = 0;
    sum += week.monday.getFullDistance();
    sum += week.tuesday.getFullDistance();
    sum += week.wednesday.getFullDistance();
    sum += week.thursday.getFullDistance();
    sum += week.friday.getFullDistance();
    sum += week.saturday.getFullDistance();
    sum += week.sunday.getFullDistance();

    return sum;
  }

  double getDistanceLeft(int id) {
    double distance = 0;

    for (var plan in plans) {
      for (var week in plan.runWeeks) {
        distance += getDistanceForWeek(week);
      }
    }

    return distance / 1000;
  }

  bool checkIfRan(RunWeek week, String currentDate) {
    switch (currentDate) {
      case "Monday":
        return week.monday.completed;
      case "Tuesday":
        return week.tuesday.completed;
      case "Wednesday":
        return week.wednesday.completed;
      case "Thursday":
        return week.thursday.completed;
      case "Friday":
        return week.friday.completed;
      case "Saturday":
        return week.saturday.completed;
      case "Sunday":
        return week.sunday.completed;
    }
    return false;
  }

  int getStreak(int id, int currentWeek, String currentDate) {
    int count = 0;
    int week = currentWeek;
    Plan plan = plans.where((plan) => plan.id == id).toList()[0];
    String date = currentDate;
    while (week >= 0) {
      RunWeek runWeek = plan.runWeeks[week];
      switch (date) {
        case "Monday":
          if (runWeek.monday.completed) {
            count++;
            date = "Sunday";
            week--;
            continue;
          } else {
            return count;
          }
        case "Tuesday":
          if (runWeek.tuesday.completed) {
            count++;
            date = "Monday";
            continue;
          } else {
            return count;
          }
        case "Wednesday":
          if (runWeek.wednesday.completed) {
            count++;
            date = "Tuesday";
            continue;
          } else {
            return count;
          }
        case "Thursday":
          if (runWeek.thursday.completed) {
            count++;
            date = "Wednesday";
            continue;
          } else {
            return count;
          }
        case "Friday":
          if (runWeek.friday.completed) {
            count++;
            date = "Thursday";
            continue;
          } else {
            return count;
          }
        case "Saturday":
          if (runWeek.saturday.completed) {
            count++;
            date = "Friday";
            continue;
          } else {
            return count;
          }
        case "Sunday":
          if (runWeek.sunday.completed) {
            count++;
            date = "Saturday";
            continue;
          } else {
            return count;
          }
      }
    }

    return count;
  }

  double getDistanceCompleted(int id) {
    double distance = 0;
    for (var plan in plans) {
      for (var week in plan.runWeeks) {
        distance += getCompletedDistanceForWeek(week);
      }
    }

    return distance / 1000;
  }

  LineChartData? getDistanceChartDataForAll() {
    List<FlSpot> spots = [];
    double smallest = 99999;
    double largest = 0;

    List<Plan> sortedPlans = plans.toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));

    Map<String, double> monthlyDistances = {};

    Map<String, int> monthIndex = {};
    int currentMonthIndex = 0;

    for (var plan in sortedPlans) {
      for (int i = 0; i < plan.runWeeks.length; i++) {
        RunWeek week = plan.runWeeks[i];
        DateTime date = plan.startDate.add(Duration(days: i * 7));

        String monthKey =
            '${date.year}-${date.month.toString().padLeft(2, '0')}';

        // Only increment index for new months
        if (!monthIndex.containsKey(monthKey)) {
          monthIndex[monthKey] = currentMonthIndex++;
        }

        var distance = getDistanceForWeekAllData(week) / 1000;

        if (monthlyDistances.containsKey(monthKey)) {
          monthlyDistances[monthKey] = monthlyDistances[monthKey]! + distance;
        } else {
          monthlyDistances[monthKey] = distance;
        }
      }
    }

    monthlyDistances.forEach((monthKey, totalDistance) {
      if (smallest > totalDistance) smallest = totalDistance;
      if (largest < totalDistance) largest = totalDistance;

      int monthIndexFromat = monthIndex[monthKey]!;
      spots.add(FlSpot(monthIndexFromat.toDouble(), totalDistance));
    });

    return LineChartData(
      minY: smallest - smallest * 0.2,
      maxY: largest + largest * 0.1,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          belowBarData: BarAreaData(show: false),
          dotData: FlDotData(show: true),
        )
      ],
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 60,
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text('${value.toStringAsFixed(0)} km',
                  style: const TextStyle(fontSize: 12));
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 1.0,
            showTitles: true,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              String monthKey = monthIndex.keys.firstWhere(
                  (key) => monthIndex[key] == index,
                  orElse: () => "");

              return Text(
                monthKey,
                style: const TextStyle(fontSize: 12),
              );
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(2)} km',
                const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

// Helper function to map month index back to the "YYYY-MM" string format
  String monthIndexToMonthKey(int index) {
    DateTime date = DateTime(2024, 1)
        .add(Duration(days: index * 30)); // Start from January 2024
    return '${date.year}-${date.month.toString().padLeft(2, '0')}';
  }

  LineChartData getDistanceChartData(int id) {
    Plan plan = plans.where((plan) => plan.id == id).toList()[0];
    List<FlSpot> spots = [];
    double smallest = 99999;
    double largest = 0;

    for (int i = 0; i < plan.runWeeks.length; i++) {
      RunWeek week = plan.runWeeks[i];
      var distance = getDistanceForWeekAllData(week) / 1000;
      if (smallest > distance) smallest = distance;
      if (largest < distance) largest = distance;
      spots.add(FlSpot(i.toDouble(), distance));
    }

    return LineChartData(
      minY: smallest - smallest * 0.2,
      maxY: largest + largest * 0.1,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          belowBarData: BarAreaData(show: false),
          dotData: FlDotData(show: true),
        )
      ],
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 60,
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text('${value.toStringAsFixed(0)} km',
                  style: const TextStyle(fontSize: 12));
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 4.0,
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text('week ${value.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 12));
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          // Custom background color
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(2)} km',
                const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  bool weekCompleted(RunWeek week) {
    if (!week.monday.completed) return false;
    if (!week.tuesday.completed) return false;
    if (!week.wednesday.completed) return false;
    if (!week.thursday.completed) return false;
    if (!week.friday.completed) return false;
    if (!week.saturday.completed) return false;
    if (!week.sunday.completed) return false;

    return true;
  }

  int getWeeksCompleted(int id) {
    Plan plan = plans.firstWhere((plan) => plan.id == id);
    int count = 0;
    for (var week in plan.runWeeks) {
      if (weekCompleted(week)) count++;
    }
    return count;
  }

  int getActivePlanId() {
    List<Plan> activePlan = plans.where((plan) => plan.active == true).toList();
    if (activePlan.isEmpty) return -1;
    return activePlan[0].id;
  }

  Plan? getPlanWithId(int id) {
    List<Plan> found = plans.where((plan) => plan.id == id).toList();
    if (found.isEmpty) return null;
    return found[0];
  }

  List<Plan> getPlans() {
    return plans.toList();
  }
}
