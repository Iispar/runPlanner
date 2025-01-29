import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

class TempoRun extends Run {
  const TempoRun({
    required super.distance,
    required super.type,
    required super.warmUp,
    required super.coolDown,
    required super.name,
    required this.speed,
    this.slowStartDistance = -1,
    this.slowStartSpeed = "null"
  });

  final String speed;
  final num slowStartDistance;
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
