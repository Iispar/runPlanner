
import 'package:run_planner/core/helpers/run_week_generator.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'package:run_planner/core/models/plan_type.dart';
import 'package:run_planner/core/models/run_type_week.dart';

generatePlan(String name, DateTime startDate, DateTime raceDate, int startMileage, int maxMileage, int offWeekFrequency, DistanceType distance, RunTypeWeek runTypes) {
  return Plan(
        name: name,
        startDate: startDate,
        raceDate:raceDate,
        startMileage: startMileage,
        maxMileage: maxMileage,
        offWeekFrequency: offWeekFrequency,
        distance: distance,
        runWeeks: runWeekGenerator(startDate, raceDate, runTypes, offWeekFrequency, startMileage, maxMileage)
        );
}