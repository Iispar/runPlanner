import 'package:run_planner/core/models/distance_type.dart';

import 'run_type.dart';
import 'run_type_week.dart';

class PlanRequest {
  const PlanRequest({
    required this.name,
    required this.startDate,
    required this.raceDate,
    required this.startMileage,
    required this.maxMileage,
    required this.offWeekFrequency,
    required this.distance,
    required this.runTypes

  });

  final String name;
  final DateTime startDate;
  final DateTime raceDate;
  final int startMileage;
  final int maxMileage;
  final int offWeekFrequency;
  final DistanceType distance;
  final RunTypeWeek runTypes;
}
