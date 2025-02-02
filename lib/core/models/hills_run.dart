import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

part "hills_run.g.dart";

@HiveType(typeId: 6, adapterName: "HillsRunAdapter")
class HillsRun extends Run {
  HillsRun({
    required super.distance,
    required super.type,
    required super.warmUp,
    required super.coolDown,
    required super.name,
    required this.workSpeed,
    required this.coolDownSpeed,
    required this.repeatCount,
    required this.hillIncline,
    this.workDistance = -1,
    this.workTime = -1,
    this.coolDownDistance = -1,
    this.coolDownTime = -1,
  });

  @HiveField(6)
  final String workSpeed;
  @HiveField(7)
  final num workDistance;
  @HiveField(8)
  final num workTime;
  @HiveField(9)
  final String coolDownSpeed;
  @HiveField(10)
  final num coolDownTime;
  @HiveField(11)
  final num coolDownDistance;
  @HiveField(12)
  final int repeatCount;
  @HiveField(13)
  final num hillIncline;

  @override
  getFullFastDistance() {
    return distance;
  }
}
