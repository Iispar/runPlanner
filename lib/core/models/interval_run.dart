import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

part "interval_run.g.dart";

@HiveType(typeId: 7, adapterName: "IntervalRunAdapter")
class IntervalRun extends Run {
  IntervalRun({
    required super.distance,
    required super.type,
    required super.warmUp,
    required super.coolDown,
    required super.name,
    required this.workSpeed,
    required this.coolDownSpeed,
    required this.repeatCount,
    this.workDistance = -1,
    this.workTime = -1,
    this.coolDownDistance = -1,
    this.coolDownTime = -1,
  });

  @HiveField(6)
  final String workSpeed;
  @HiveField(7)
  final num workTime;
  @HiveField(8)
  final num workDistance;
  @HiveField(9)
  final String coolDownSpeed;
  @HiveField(10)
  final num coolDownTime;
  @HiveField(11)
  final num coolDownDistance;
  @HiveField(12)
  final int repeatCount;
}
