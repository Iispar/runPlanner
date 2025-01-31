import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_planner/core/widgets/Responsive_widget.dart';
import 'package:run_planner/features/all/filters.dart';
import 'package:run_planner/features/all/plans_list.dart';

import '../../core/controllers/plan_controller.dart';
import '../../core/models/distance_type.dart';

class AllPlans extends StatefulWidget {
  const AllPlans({super.key});

  @override
  AllPlansState createState() => AllPlansState();
}

class AllPlansState extends State<AllPlans> {
  final controller = Get.find<PlanController>();
  final timeNow = DateTime.now();
  RxString filter = ''.obs;
  RxList distanceFilters = [].obs;
  RxList statusFilters = [].obs;
  RxBool isFiltering = false.obs;

  List getFilteredPlans(List<dynamic> plans) {
    return plans.where((plan) {
      final status = plan.raceDate.isBefore(timeNow) ? "Past" : "Upcoming";
      return plan.name.toLowerCase().contains(filter.value.toLowerCase()) &&
          (distanceFilters.isEmpty ||
              distanceFilters.contains(plan.distance)) &&
          (statusFilters.isEmpty || statusFilters.contains(status));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final plans = controller.getPlans();
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              spacing: 5,
              children: [
                Expanded(
                    child: TextField(
                  onChanged: (value) => filter.value = value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: ResponsiveWidget(
                        mobile: Obx(() => IconButton(
                              icon: Icon(
                                  isFiltering.value ? Icons.check : Icons.filter_alt_outlined),
                              onPressed: () =>
                                  isFiltering.value = !isFiltering.value,
                            )),
                        desktop: SizedBox.shrink()),
                  ),
                )),
                SizedBox(
                    height: kMinInteractiveDimension,
                    child: IconButton.filled(
                      style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    )),
              ],
            )),
        Expanded(
          child: ResponsiveWidget(
            mobile: Obx(() => isFiltering.value
                ? FiltersWidget(
                    distanceFilters: distanceFilters,
                    statusFilters: statusFilters,
                  )
                : PlansList(plans: getFilteredPlans(plans))),
            desktop: Row(
              children: [
                Expanded(
                  child: Obx(() => getFilteredPlans(plans).isNotEmpty
                      ? PlansList(plans: getFilteredPlans(plans))
                      : const Center(child: Text("No results"))),
                ),
                SizedBox(
                    width: 300,
                    child: Card.outlined(
                        child: FiltersWidget(
                      distanceFilters: distanceFilters,
                      statusFilters: statusFilters,
                    )))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
