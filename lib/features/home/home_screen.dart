import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'package:run_planner/core/models/plan_type.dart';
import 'package:run_planner/core/models/run_type.dart';
import 'package:run_planner/core/models/run_type_week.dart';

import '../../core/helpers/run_week_generator.dart';

class Home extends StatelessWidget {
  final controller = Get.find<PlanController>();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    Plan plan = Plan(
        name: "Paave nurmi",
        startDate: DateTime(2024, 12, 30),
        raceDate: DateTime(2025, 4, 26),
        startMileage: 20,
        maxMileage: 35,
        offWeekFrequency: 5,
        distance: DistanceType.ten,
        runWeeks: runWeekGenerator(
          DateTime(2024, 12, 30),
          DateTime(2025, 4, 26),
          RunTypeWeek(
            monday: RunType.fast,
            tuesday: RunType.slow,
            wednesday: RunType.none,
            thursday: RunType.long,
            friday: RunType.slow,
            saturday: RunType.none,
            sunday: RunType.none),
            5,
            20,
            35,
            ));
    controller.addPlan(plan);

    return Center(child: FilledButton(onPressed: () {}, child: Text("hello")));
  }
}
