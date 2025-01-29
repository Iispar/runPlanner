import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

class IntervalRun extends Run {
  const IntervalRun({
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

  final String workSpeed;
  final num workTime;
  final num workDistance;
  final String coolDownSpeed;
  final num coolDownTime;
  final num coolDownDistance;
  final int repeatCount;
}
