import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:run_planner/core/models/plan_type.dart';

class PlanController {
  final storage = Hive.box("storage");

  RxList<Plan> plans;

  PlanController() : plans = <Plan>[].obs {
    plans.value =
        storage.get('plans') ?? [];
  }

  void addPlan(Plan plan) {
    plan.calculateTotalMileage();
    plans.add(plan);
    storage.put('plans', plans.toList());
  }

  List<Plan> getPlans() {
    return plans.toList();
  }
}
