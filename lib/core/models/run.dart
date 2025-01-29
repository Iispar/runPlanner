import 'package:run_planner/core/models/distance_type.dart';
import 'run_type.dart';

class Run {
  const Run({
    required this.distance,
    required this.type,
    required this.warmUp,
    required this.coolDown,
    required this.name,
  });

  final String name;
  final num distance;
  final RunType type;
  final num warmUp;
  final num coolDown;

  getFullFastDistance() {
    return distance;
  }

  getFullDistance() {
    return distance;
  }
}
