import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/models/run_week.dart';

class WeekCard extends StatefulWidget {
  const WeekCard({super.key, required this.week, required this.id});
  final RunWeek week;
  final int id;

  @override
  WeekCardState createState() => WeekCardState();
}

class WeekCardState extends State<WeekCard> {
  final controller = Get.find<PlanController>();
  RxBool mondayCheckbox = false.obs;

  void setCheckbox(val, checkbox, week) {
    checkbox.value = val!;
    controller.updateRunweek(widget.id, week);
  }

  @override
  Card build(BuildContext context) {
    var week = widget.week;
    mondayCheckbox.value = week.monday.completed;
    return Card.outlined(
        child: Column(children: [
      ListTile(
        title: Text("Week number ${week.weekNumber}"),
      ),
      Row(children: [
        Text("Monday: "),
        Text(week.monday.name),
        Obx(() => Checkbox(
              value: mondayCheckbox.value,
              onChanged: (val) => {
                week.monday.completed = val!,
                setCheckbox(val, mondayCheckbox, week)},
            )),
      ])
    ]));
  }
}
