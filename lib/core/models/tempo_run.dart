import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

part "tempo_run.g.dart";

@HiveType(typeId: 5, adapterName: "TempoRunAdapter")
class TempoRun extends Run {
  const TempoRun(
      {required super.distance,
      required super.type,
      required super.warmUp,
      required super.coolDown,
      required super.name,
      required this.speed,
      this.slowStartDistance = -1,
      this.slowStartSpeed = "null"});

  @HiveField(6)
  final String speed;
  @HiveField(7)
  final num slowStartDistance;
  @HiveField(8)
  final String slowStartSpeed;

  @override
  getFullFastDistance() {
    return distance;
  }

  @override
  getFullDistance() {
    return distance + slowStartDistance;
  }
}
