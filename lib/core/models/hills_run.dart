import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

class HillsRun extends Run {
  const HillsRun({
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

  final String workSpeed;
  final num workDistance;
  final num workTime;
  final String coolDownSpeed;
  final num coolDownTime;
  final num coolDownDistance;
  final int repeatCount;
  final num hillIncline;

@override
  getFullFastDistance() {
    return distance;
  }
}
