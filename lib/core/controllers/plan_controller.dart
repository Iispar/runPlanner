import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:run_planner/core/models/plan_type.dart';

class PlanController {
  final storage = Hive.box("storage");

  RxList<Plan> plans;

  PlanController() : plans = <Plan>[].obs {
     plans.value =
        (storage.get('plans') as List<dynamic>?)
            ?.map((e) => e as Plan)
            .toList() ?? [];
  }

  void addPlan(Plan plan) {
    plan.calculateTotalMileage();
    plans.add(plan);
    storage.put('plans', plans.toList());
  }

  int getId() {
    if (plans.isEmpty) return 0;
    return plans[plans.length - 1].id + 1;
  }

  Plan getPlanWithId(int id) {
    return plans.where((plan) => plan.id == id).toList()[0];
  }

  List<Plan> getPlans() {
    return plans.toList();
  }
}
