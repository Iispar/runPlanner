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
  RxBool tuesdayCheckbox = false.obs;
  RxBool wednesdayCheckbox = false.obs;
  RxBool thursdayCheckbox = false.obs;
  RxBool fridayCheckbox = false.obs;
  RxBool saturdayCheckbox = false.obs;
  RxBool sundayCheckbox = false.obs;

  void setCheckbox(val, checkbox, week) {
    checkbox.value = val!;
    controller.updateRunweek(widget.id, week);
  }

  Widget checkBoxItem(title, day, checkbox, RunWeek week) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          Text(title),
          Text(day.name),
          Spacer(),
          Obx(() => Checkbox(
                value: checkbox.value,
                onChanged: (val) =>
                    {day.completed = val!, setCheckbox(val, checkbox, week)},
              )),
        ]));
  }

  @override
  Card build(BuildContext context) {
    var week = widget.week;
    mondayCheckbox.value = week.monday.completed;
    tuesdayCheckbox.value = week.tuesday.completed;
    wednesdayCheckbox.value = week.wednesday.completed;
    thursdayCheckbox.value = week.thursday.completed;
    fridayCheckbox.value = week.friday.completed;
    saturdayCheckbox.value = week.saturday.completed;
    sundayCheckbox.value = week.sunday.completed;
    return Card.outlined(
        child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(children: [
              ListTile(
                title: Text("Week number ${week.weekNumber}"),
              ),
              checkBoxItem("Monday: ", week.monday, mondayCheckbox, week),
              checkBoxItem("Tuesday: ", week.tuesday, tuesdayCheckbox, week),
              checkBoxItem(
                  "Wednesday: ", week.wednesday, wednesdayCheckbox, week),
              checkBoxItem("Thursday: ", week.thursday, thursdayCheckbox, week),
              checkBoxItem("Friday: ", week.friday, fridayCheckbox, week),
              checkBoxItem("Saturday: ", week.saturday, saturdayCheckbox, week),
              checkBoxItem("Sunday: ", week.sunday, sundayCheckbox, week),
            ])));
  }
}
