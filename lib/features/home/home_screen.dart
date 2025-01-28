import 'package:flutter/material.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'package:run_planner/core/models/run_type.dart';
import 'package:run_planner/core/models/run_type_week.dart';

import '../../core/models/Plan.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Plan plan = Plan(
        name: "Paave nurmi",
        startDate: DateTime(2022, 2, 2),
        raceDate: DateTime(2022, 4, 2),
        startMileage: 0,
        maxMileage: 50,
        offWeekFrequency: 4,
        distance: DistanceType.full,
        runTypes: RunTypeWeek(
            monday: RunType.fast,
            tuesday: RunType.slow,
            wednesday: RunType.none,
            thursday: RunType.long,
            friday: RunType.slow,
            saturday: RunType.none,
            sunday: RunType.none));
    for (final run in plan.runWeeks) {
      print(run.monday.distance);
      print(run.tuesday.distance);
      print(run.wednesday.distance);
      print(run.thursday.distance);
      print(run.friday.distance);
      print(run.saturday.distance);
      print(run.sunday.distance);
    }

    plan.calculateTotalMileage();
    print(plan.totalMileage);
    return Center(child: FilledButton(onPressed: () {}, child: Text("hello")));
  }
}
