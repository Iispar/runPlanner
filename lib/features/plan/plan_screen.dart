import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/models/plan_type.dart';
import 'package:run_planner/core/models/run_week.dart';
import 'package:run_planner/features/plan/Week_card.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  PlanScreenState createState() => PlanScreenState();
}

class PlanScreenState extends State<PlanScreen> {
  final controller = Get.find<PlanController>();

  List<Widget> mapWeeksToChildren(List<RunWeek> runWeeks) {
    return runWeeks
        .map((RunWeek week) => Card.outlined(
            child: ListTile(title: Text("runs for week ${week.weekNumber}"))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Plan plan = controller.getPlanWithId(
        Get.parameters["id"] != null ? int.parse(Get.parameters["id"]!) : -1);

    int daysToGo = plan.raceDate.difference(DateTime.now()).inDays;
    int daysPassed = DateTime.now().difference(plan.startDate).inDays;

    double percentageToGo = daysPassed / daysToGo;

    return Column(children: [
      Text(plan.name),
      Card.outlined(
          child: Column(children: [
        ListTile(
          onTap: () {
            Get.toNamed("/plan/id/${plan.id}");
          },
          title: Text("${(daysToGo / 7).floor()} weeks to go!"),
          subtitle: Text(
              "Race date: ${plan.raceDate.day}/${plan.raceDate.month}/${plan.raceDate.year}"),
        ),
        Padding(
            padding: EdgeInsets.only(left: 40, bottom: 14, right: 40, top: 2),
            child: LinearProgressIndicator(
              value: percentageToGo,
            )),
      ])),
      Expanded(
          child: ListView(
              children:
                  plan.runWeeks.map((week) => WeekCard(week: week, id: plan.id)).toList()))
    ]);
  }
}
