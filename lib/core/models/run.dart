import 'package:run_planner/core/models/distance_type.dart';
import 'run_type.dart';

class Run {
  const Run({
    required this.distance,
    required this.type,
  });
  final int distance;
  final RunType type;
}
