import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

part "run_week.g.dart";

@HiveType(typeId: 2, adapterName: "RunWeekAdapter")
class RunWeek {
  const RunWeek({
    required this.weekNumber,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  @HiveField(0)
  final int weekNumber;
  @HiveField(1)
  final Run monday;
  @HiveField(2)
  final Run tuesday;
  @HiveField(3)
  final Run wednesday;
  @HiveField(4)
  final Run thursday;
  @HiveField(5)
  final Run friday;
  @HiveField(6)
  final Run saturday;
  @HiveField(7)
  final Run sunday;
}
