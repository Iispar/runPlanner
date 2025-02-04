import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/controllers/plan_controller.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final controller = Get.find<PlanController>();

  @override
  Widget build(BuildContext context) {
    int activePlan = controller.getActivePlanId();
    return Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(children: [
          AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Material(
              child: ListTile(
            title: Center(child: const Text('Home')),
            onTap: () {
              Get.toNamed("home");
            },
          )),
          activePlan != -1
              ? Material(
                  child: ListTile(
                  title: Center(child: const Text('Active')),
                  onTap: () {
                    Get.toNamed("/plan/id/$activePlan");
                  },
                ))
              : SizedBox.shrink(),
          Material(
              child: ListTile(
            title: Center(child: const Text('All')),
            onTap: () {
              Get.toNamed("all");
            },
          )),
        ]));
  }
}
