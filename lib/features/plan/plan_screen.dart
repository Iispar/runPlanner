import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';
import 'package:run_planner/core/models/plan_type.dart';
import 'package:run_planner/core/widgets/Responsive_widget.dart';
import 'package:run_planner/core/widgets/week_card.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  PlanScreenState createState() => PlanScreenState();
}

class PlanScreenState extends State<PlanScreen> {
  final controller = Get.find<PlanController>();
  final ScrollController _scrollController = ScrollController();

  RxBool active = false.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentWeek();
    });
  }

  AlertDialog deletePlan(id) {
    return AlertDialog(
      title: Text("Are you sure you want to delete?"),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            controller.deletePlan(id);
            Get.toNamed("/all");
          },
        ),
      ],
    );
  }

  void markAsActive(int id, value) {
    active.value = value;
    controller.markAsActive(id, value);
  }

  void _scrollToCurrentWeek() {
    Plan? plan = controller.getPlanWithId(
      Get.parameters["id"] != null ? int.parse(Get.parameters["id"]!) : -1,
    );

    if (plan == null) throw "plan not found";

    int daysPassed = DateTime.now().difference(plan.startDate).inDays;
    int currentWeekIndex = (daysPassed / 7).floor();

    if (currentWeekIndex < 0) currentWeekIndex = 0;
    if (currentWeekIndex >= plan.runWeeks.length) {
      currentWeekIndex = plan.runWeeks.length - 1;
    }

    _scrollController.jumpTo(
      currentWeekIndex * 277.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    Plan? plan = controller.getPlanWithId(
      Get.parameters["id"] != null ? int.parse(Get.parameters["id"]!) : -1,
    );
    if (plan == null) throw "Plan not found";
    active.value = plan.active;

    int daysToGo = plan.raceDate.difference(DateTime.now()).inDays;
    int daysPassed = DateTime.now().difference(plan.startDate).inDays;
    double percentageToGo = daysPassed / daysToGo;

    double completedDistance = controller.getDistanceCompleted(plan.id);
    double distanceLeft = controller.getDistanceLeft(plan.id);
    int weeksCompleted = controller.getWeeksCompleted(plan.id);
    int streak =
        controller.getStreak(plan.id, (daysPassed / 7).floor(), getYesterday());
    int currentWeekIndex = (daysPassed / 7).floor();
    int currentDate = DateTime.now().weekday;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(spacing: 10, children: [
              ResponsiveWidget(mobile: 
              Flexible( flex: 8, child: Text(plan.name, style: Theme.of(context).textTheme.headlineLarge)), desktop: Text(plan.name, style: Theme.of(context).textTheme.headlineLarge), tablet: Text(plan.name, style: Theme.of(context).textTheme.headlineLarge)),
              Spacer(),
              SizedBox(
                  height: kMinInteractiveDimension,
                  width: kMinInteractiveDimension,
                  child: Obx(
                    () => active.value
                        ? IconButton.filled(
                            style: IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              markAsActive(plan.id, !active.value);
                            },
                            icon: Icon(Icons.star,
                                color: Theme.of(context).colorScheme.surface),
                          )
                        : IconButton(
                            style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1),
                              ),
                            ),
                            onPressed: () {
                              markAsActive(plan.id, !active.value);
                            },
                            icon: const Icon(Icons.star),
                          ),
                  )),
              SizedBox(
                  height: kMinInteractiveDimension,
                  width: kMinInteractiveDimension,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return deletePlan(plan.id);
                          });
                    },
                    icon: const Icon(Icons.delete),
                  )),
            ])),
        Expanded(
            child: Row(children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Card.outlined(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed("/plan/id/${plan.id}");
                        },
                        title: Text("${(daysToGo / 7).floor()} weeks to go!"),
                        subtitle: Text(
                          "Race date: ${plan.raceDate.day}/${plan.raceDate.month}/${plan.raceDate.year}",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 40, left: 40, bottom: 10),
                        child: LinearProgressIndicator(value: percentageToGo),
                      ),
                    ],
                  ),
                ),
                ResponsiveWidget(
                    mobile: SizedBox.shrink(),
                    tablet: SizedBox.shrink(),
                    desktop: Card.outlined(
                        child: ListTile(
                            title: Text("You are on a $streak day streak!"),
                            trailing: Icon(Icons.local_fire_department)))),
                Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 4, top: 10),
                    child: Text("About this plan",
                        style: Theme.of(context).textTheme.headlineSmall)),
                Row(children: [
                  Expanded(
                      flex: 2,
                      child: ResponsiveWidget(
                          mobile: Card.outlined(
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
                                                  "Distance left: ${distanceLeft.floor()}km"),
                                              Text(
                                                  "Distance completed: ${completedDistance}km"),
                                              Text(
                                                  "Weeks completed: $weeksCompleted"),
                                              ResponsiveWidget(
                                                  mobile:
                                                      Text("Streak: $streak"),
                                                  tablet: SizedBox.shrink(),
                                                  desktop: SizedBox.shrink())
                                            ])),
                                  ]),
                            ),
                          ),
                          desktop: Card.outlined(
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
                                                  "Distance left: ${distanceLeft.floor()}km"),
                                              Text(
                                                  "Distance completed: ${completedDistance}km"),
                                              Text(
                                                  "Weeks completed: $weeksCompleted"),
                                              ResponsiveWidget(
                                                  mobile:
                                                      Text("Streak: $streak"),
                                                  tablet: SizedBox.shrink(),
                                                  desktop: SizedBox.shrink())
                                            ])),
                                  ]),
                            ),
                          ),
                          tablet: SizedBox(
                              height: 300,
                              child: Card.outlined(
                                child: ListTile(
                                    title: Text("Statistics"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 4),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Distance left:"),
                                                  Text(
                                                      "${distanceLeft.floor()}km"),
                                                  Text("Distance completed: "),
                                                  Text(
                                                      "${completedDistance}km"),
                                                  Text("Weeks completed:"),
                                                  Text("$weeksCompleted"),
                                                  Text("Streak"),
                                                  Text("$streak")
                                                ])),
                                      ],
                                    )),
                              )))),
                  ResponsiveWidget(
                    mobile: SizedBox.shrink(),
                    desktop: SizedBox.shrink(),
                    tablet: Flexible(
                        flex: 6,
                        child: ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: 300),
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
                                            .getDistanceChartData(plan.id),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                  )
                ]),
                ResponsiveWidget(
                    mobile: SizedBox.shrink(),
                    tablet: SizedBox.shrink(),
                    desktop: Flexible(
                        child: ConstrainedBox(
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
                                  controller.getDistanceChartData(plan.id),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
                ResponsiveWidget(
                    mobile: Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 14),
                        child: Text("Run weeks",
                            style: Theme.of(context).textTheme.headlineSmall)),
                    desktop: SizedBox.shrink(),
                    tablet: Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 14),
                        child: Text("Run weeks",
                            style: Theme.of(context).textTheme.headlineSmall))),
                ResponsiveWidget(
                    mobile: Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: plan.runWeeks.length,
                        itemBuilder: (context, index) {
                          return WeekCard(
                              week: plan.runWeeks[index],
                              id: plan.id,
                              activeIndex:
                                  index == currentWeekIndex ? currentDate : -1);
                        },
                      ),
                    ),
                    tablet: Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: plan.runWeeks.length,
                        itemBuilder: (context, index) {
                          return WeekCard(
                              week: plan.runWeeks[index],
                              id: plan.id,
                              activeIndex:
                                  index == currentWeekIndex ? currentDate : -1);
                        },
                      ),
                    ),
                    desktop: SizedBox.shrink()),
              ])),
          ResponsiveWidget(
              mobile: SizedBox.shrink(),
              tablet: SizedBox.shrink(),
              desktop: Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 14),
                        child: Text("Run weeks",
                            style: Theme.of(context).textTheme.headlineSmall)),
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: plan.runWeeks.length,
                        itemBuilder: (context, index) {
                          return WeekCard(
                              week: plan.runWeeks[index],
                              id: plan.id,
                              activeIndex:
                                  index == currentWeekIndex ? currentDate : -1);
                        },
                      ),
                    )
                  ])))
        ])),
      ],
    );
  }

  String getYesterday() {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    return days[yesterday.weekday - 1];
  }
}
