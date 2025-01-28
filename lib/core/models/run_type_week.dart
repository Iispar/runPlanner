import 'package:run_planner/core/models/distance_type.dart';
import 'run_type.dart';

class RunTypeWeek {
  const RunTypeWeek({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,

  });

  final RunType monday;
  final RunType tuesday;
  final RunType wednesday;
  final RunType thursday;
  final RunType friday;
  final RunType saturday;
  final RunType sunday;
}
