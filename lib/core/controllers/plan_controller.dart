import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import '../models/plan.dart';

class PlanController {
  final storage = Hive.box("storage");

  RxList plans;

  PlanController() : plans = [].obs {
    plans.value =
        storage.get('plans') ?? [];
  }

  void addPlan(Plan plan) {
    plan.calculateTotalMileage();
    plans.add(plan);
    storage.put('plans', plans);
  }

  List getPlans() {
    return plans.toList();
  }
}
