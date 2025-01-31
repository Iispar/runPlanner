import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/models/distance_type.dart';

class FiltersWidget extends StatelessWidget {
  final RxList distanceFilters;
  final RxList statusFilters;

  const FiltersWidget({
    super.key,
    required this.distanceFilters,
    required this.statusFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text("Filter by", style: Theme.of(context).textTheme.headlineSmall),
            Divider(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Distance", style: Theme.of(context).textTheme.bodyLarge),
              Wrap(
                children: DistanceType.values.map((distance) {
                  return Obx(() => FilterChip(
                        label: Text(distance.name),
                        selected: distanceFilters.contains(distance),
                        onSelected: (selected) {
                          selected
                              ? distanceFilters.add(distance)
                              : distanceFilters.remove(distance);
                        },
                      ));
                }).toList(),
              )
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Status", style: Theme.of(context).textTheme.bodyLarge),
              Wrap(
                children: ["Past", "Upcoming"].map((status) {
                  return Obx(() => FilterChip(
                        label: Text(status),
                        selected: statusFilters.contains(status),
                        onSelected: (selected) {
                          selected
                              ? statusFilters.add(status)
                              : statusFilters.remove(status);
                        },
                      ));
                }).toList(),
              )
            ]),
          ],
        ));
  }
}
