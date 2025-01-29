import 'package:run_planner/core/models/run_week.dart';

getTotalMileage(List<RunWeek> runWeeks) {
  num mileage = 0;

  for (final run in runWeeks) {
    mileage += run.monday.distance;
    mileage += run.tuesday.distance;
    mileage += run.wednesday.distance;
    mileage += run.thursday.distance;
    mileage += run.friday.distance;
    mileage += run.saturday.distance;
    mileage += run.sunday.distance;
  }

  return mileage;
}
