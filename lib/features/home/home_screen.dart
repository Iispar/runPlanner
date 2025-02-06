import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'package:run_planner/core/models/plan_type.dart';
import 'package:run_planner/core/models/run_type.dart';
import 'package:run_planner/core/models/run_type_week.dart';
import 'package:run_planner/core/models/run_week.dart';
import 'package:run_planner/core/widgets/Responsive_widget.dart';
import 'package:run_planner/core/widgets/week_card.dart';

import '../../core/helpers/run_week_generator.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<PlanController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Plan test = Plan(
        id: controller.getId(),
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
              saturday: RunType.gym,
              sunday: RunType.none),
          5,
          20,
          35,
        ));
    // controller.addPlan(test);

    int activeId = controller.getActivePlanId();
    bool anyRuns = controller.checkIfAnyPlans();

    Plan? activePlan = controller.getPlanWithId(
      activeId != -1 ? activeId : -1,
    );

    int? currentWeekIndex;
    int? currentDate;
    if (activePlan != null) {
      int daysPassed = DateTime.now().difference(activePlan.startDate).inDays;
      currentWeekIndex = (daysPassed / 7).floor();
      currentDate = daysPassed % 7;
    }

    List<Plan> upcomingPlans = controller.getNextThreePlans();
    int upcomingPlansCount = controller.getUpcomingPlansCount();
    int completedPlansCount = controller.getCompletedPlansCount();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Welcome!",
                style: Theme.of(context).textTheme.headlineLarge)),
        !anyRuns
            ? Card.filled(
                child: ListTile(
                    minTileHeight: 64,
                    title: Text("Create some plans to get started!",
                        style: Theme.of(context).textTheme.bodyLarge),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Get.toNamed("/create");
                    }))
            : Column(children: [
                Row(children: [
                  Expanded(
                      flex: 7,
                      child: Card.outlined(
                          child: activePlan != null
                              ? ListTile(
                                  title: Text("Currently active plan"),
                                  subtitle: Text(activePlan.name),
                                  trailing: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Get.toNamed("/plan/id/${activePlan.id}");
                                  })
                              : ListTile(
                                  title: Text("No active plan selected"),
                                  subtitle: Text(
                                      "Favourite a project to see it here."),
                                ))),
                  ResponsiveWidget(
                    mobile: SizedBox.shrink(),
                    tablet: Expanded(
                        flex: 4,
                        child: Card.filled(
                            child: ListTile(
                                minTileHeight: 64,
                                title: Text("Create a new plan"),
                                trailing: Icon(Icons.arrow_forward),
                                onTap: () {
                                  Get.toNamed("/create");
                                }))),
                    desktop: Expanded(
                        flex: 3,
                        child: Card.filled(
                            child: ListTile(
                                minTileHeight: 64,
                                title: Text("Create a new plan"),
                                trailing: Icon(Icons.arrow_forward),
                                onTap: () {
                                  Get.toNamed("/create");
                                }))),
                  ),
                ]),
                (activePlan != null && currentWeekIndex != null)
                    ? activePlan.runWeeks.length > currentWeekIndex ||
                            currentWeekIndex < 0
                        ? WeekCard(
                            week: activePlan.runWeeks[currentWeekIndex],
                            id: activePlan.id,
                            activeIndex: currentDate!)
                        : Card.outlined(
                            child:
                                ListTile(title: Text("No runs for this week")))
                    : SizedBox.shrink(),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text("About your plans",
                                style:
                                    Theme.of(context).textTheme.headlineSmall)),
                        Card.outlined(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              ListTile(
                                  title: Text("Upcoming races"),
                                  subtitle: Padding(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            upcomingPlans.isEmpty
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10),
                                                    child: Text(
                                                        "No upcoming plans"))
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: upcomingPlans
                                                        .map((plan) => Text(
                                                            "${plan.name} ${plan.startDate.day}/${plan.startDate.month}/${plan.startDate.year}"))
                                                        .toList())
                                          ])))
                            ])),
                        Card.outlined(
                            child: ListTile(
                          title: Text("Statistics"),
                          subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Upcoming plans: $upcomingPlansCount"),
                                          Text(
                                              "Plans completed: $completedPlansCount"),
                                        ]))
                              ]),
                        )),
                      ])),
                  ResponsiveWidget(
                      mobile: SizedBox.shrink(),
                      desktop: Expanded(
                          child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 400),
                              child: Column(children: [
                                SizedBox(height: 42),
                                Expanded(child: Card.outlined(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 40,
                                      left: 10,
                                      top: 20,
                                      bottom: 5,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 14),
                                          child: Text(
                                            "Distance over time",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                        Flexible(
                                          child: LineChart(
                                            controller
                                                .getDistanceChartDataForAll()!,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                              ]))),
                      tablet: SizedBox.shrink())
                ]),
                ResponsiveWidget(
                    mobile: Card.filled(
                        child: ListTile(
                            title: Text("Create a new plan"),
                            trailing: Icon(Icons.arrow_forward),
                            onTap: () {
                              Get.toNamed("/create");
                            })),
                    tablet: SizedBox.shrink(),
                    desktop: SizedBox.shrink()),
                ResponsiveWidget(
                    mobile: SizedBox.shrink(),
                    desktop: SizedBox.shrink(),
                    tablet: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 400),
                      child: Card.outlined(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 40,
                            left: 10,
                            top: 20,
                            bottom: 5,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: Text(
                                  "Distance over time",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              Flexible(
                                child: LineChart(
                                  controller.getDistanceChartDataForAll()!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ])
      ],
    );
  }
}
