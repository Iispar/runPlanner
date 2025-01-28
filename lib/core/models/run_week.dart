import 'package:run_planner/core/models/distance_type.dart';
import 'run.dart';
import 'run_type.dart';

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

  final int weekNumber;
  final Run monday;
  final Run tuesday;
  final Run wednesday;
  final Run thursday;
  final Run friday;
  final Run saturday;
  final Run sunday;
}
