import 'package:hive_ce/hive.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'package:run_planner/core/models/run_week.dart';
import '../helpers/total_mileage_calculator.dart';

part 'plan_type.g.dart';

@HiveType(typeId: 0, adapterName: "PlanAdapter")
class Plan extends HiveObject {
  Plan(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.raceDate,
      required this.startMileage,
      required this.maxMileage,
      required this.offWeekFrequency,
      required this.distance,
      required this.runWeeks});

  @HiveField(0)
  final String name;
  @HiveField(1)
  final DateTime startDate;
  @HiveField(2)
  final DateTime raceDate;
  @HiveField(3)
  final int startMileage;
  @HiveField(4)
  final int maxMileage;
  @HiveField(5)
  final int offWeekFrequency;
  @HiveField(6)
  final DistanceType distance;
  @HiveField(7)
  final List<RunWeek> runWeeks;
  @HiveField(8)
  late num totalMileage;
  @HiveField(9)
  late num currentDistance = 0;
  @HiveField(10)
  late int currentWeek = 0;
  @HiveField(11)
  late bool active = false;
  @HiveField(12)
  final int id;

  void calculateTotalMileage() {
    totalMileage = getTotalMileage(runWeeks);
  }
}
