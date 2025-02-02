import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/models/plan_type.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  PlanScreenState createState() => PlanScreenState();
}

class PlanScreenState extends State<PlanScreen> {
  final controller = Get.find<PlanController>();

  @override
  Widget build(BuildContext context) {
    Plan plan = controller.getPlanWithId(
        Get.parameters["id"] != null ? int.parse(Get.parameters["id"]!) : -1);
    return Column(children: [
      Text(plan.name),
      
    ]);
  }
}
