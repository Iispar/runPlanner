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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Filter by"),
        const Text("Distance"),
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
        ),
        const Text("Status"),
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
        ),
      ],
    );
  }
}
