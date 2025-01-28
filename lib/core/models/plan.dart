import 'package:run_planner/core/helpers/run_week_generator.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'package:run_planner/core/models/run_week.dart';

import '../helpers/total_mileage_calculator.dart';
import 'run_type.dart';
import 'run_type_week.dart';

class Plan {
  Plan(
      {required this.name,
      required this.startDate,
      required this.raceDate,
      required this.startMileage,
      required this.maxMileage,
      required this.offWeekFrequency,
      required this.distance,
      required RunTypeWeek runTypes})
      : runWeeks = runWeekGenerator(startDate, raceDate, runTypes,
            offWeekFrequency, startMileage, maxMileage);

  final String name;
  final DateTime startDate;
  final DateTime raceDate;
  final int startMileage;
  final int maxMileage;
  final int offWeekFrequency;
  final DistanceType distance;

  final List<RunWeek> runWeeks;
  late int totalMileage;
  late int currentDistance = 0;
  late int currentWeek = 0;

  void calculateTotalMileage() {
    totalMileage = getTotalMileage(runWeeks);
  }
}
