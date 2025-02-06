import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/models/run_week.dart';

class WeekCard extends StatefulWidget {
  const WeekCard(
      {super.key,
      required this.week,
      required this.id,
      required this.activeIndex});
  final RunWeek week;
  final int id;
  final int activeIndex;

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

  Widget checkBoxItem(title, day, checkbox, RunWeek week, bool active) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Row(children: [
          active
              ? Text("Today: ", style: TextStyle(fontWeight: FontWeight.bold))
              : Text(title),
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
        shape: widget.activeIndex != -1
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary, // Border color
                  width: 3.0, // Thickness of the border
                ),
                borderRadius:
                    BorderRadius.circular(12), // Optional: Add rounded corners
              )
            : null,
        child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: ListTile(
                title: Text("Week number ${week.weekNumber}"),
                subtitle: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider()),
                  checkBoxItem("Monday: ", week.monday, mondayCheckbox, week,
                      widget.activeIndex == 1),
                  checkBoxItem("Tuesday: ", week.tuesday, tuesdayCheckbox, week,
                      widget.activeIndex == 2),
                  checkBoxItem("Wednesday: ", week.wednesday, wednesdayCheckbox,
                      week, widget.activeIndex == 3),
                  checkBoxItem("Thursday: ", week.thursday, thursdayCheckbox,
                      week, widget.activeIndex == 4),
                  checkBoxItem("Friday: ", week.friday, fridayCheckbox, week,
                      widget.activeIndex == 5),
                  checkBoxItem("Saturday: ", week.saturday, saturdayCheckbox,
                      week, widget.activeIndex == 6),
                  checkBoxItem("Sunday: ", week.sunday, sundayCheckbox, week,
                      widget.activeIndex == 7),
                ]))));
  }
}
