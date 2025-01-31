import 'package:flutter/material.dart';

class PlansList extends StatelessWidget {
  final List<dynamic> plans;
  const PlansList({super.key, required this.plans});

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();

    final planCards = plans
        .map((plan) => Card.outlined(
                child: ListTile(
              onTap: () {},
              title: Text(plan.name),
              subtitle: Text(plan.distance.value),
              leading: CircleAvatar(child: Text(plan.name[0])),
              trailing: plan.raceDate.isAfter(currentDate)
                  ? Text("upcoming")
                  : Text("completed"),
            )))
        .toList();

    return ListView(children: planCards);
  }
}
