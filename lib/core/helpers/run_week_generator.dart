
import 'package:run_planner/core/models/run_type_week.dart';

import '../models/run.dart';
import '../models/run_type.dart';
import '../models/run_week.dart';

runWeekGenerator(DateTime startDate, DateTime raceDate, RunTypeWeek runTypes, int offWeekFrequency, int startMileage, int maxMileage) {
  List<RunWeek> weeks = [];
  int dayCount = raceDate.difference(startDate).inDays;
  int weekCount = (dayCount / 7).floor();
  int raceWeekDate = dayCount % 7;

  if (raceWeekDate == 0) weekCount - 1;

  for (int i = 1; i <= weekCount; i++) {
    weeks.add(
      RunWeek(
        weekNumber: i,
        monday: getRunForDate(runTypes.monday),
        tuesday: getRunForDate(runTypes.tuesday),
        wednesday: getRunForDate(runTypes.wednesday),
        thursday: getRunForDate(runTypes.thursday),
        friday: getRunForDate(runTypes.friday),
        saturday: getRunForDate(runTypes.saturday),
        sunday: getRunForDate(runTypes.sunday))
    );
  }


  weeks.add(
    RunWeek(
      weekNumber: weekCount + 1,
      monday: raceWeekDate == 1 ? getRunForDate(RunType.race) : getRunForDate(runTypes.monday),
      tuesday: raceWeekDate == 2 ? getRunForDate(RunType.race) : getRunForDate(runTypes.tuesday),
      wednesday: raceWeekDate == 3 ? getRunForDate(RunType.race) : getRunForDate(runTypes.wednesday),
      thursday: raceWeekDate == 4 ? getRunForDate(RunType.race) : getRunForDate(runTypes.thursday),
      friday: raceWeekDate == 5 ? getRunForDate(RunType.race) : getRunForDate(runTypes.friday),
      saturday: raceWeekDate == 6 ? getRunForDate(RunType.race) : getRunForDate(runTypes.saturday),
      sunday: raceWeekDate == 0 ? getRunForDate(RunType.race) : getRunForDate(runTypes.saturday))
  );

  return weeks;
}

getRunForDate(RunType runType) {
  switch (runType) {
    case RunType.fast:
      return Run(distance: 5000, type: runType);
    case RunType.slow:
      return Run(distance: 1000, type: runType);
    case RunType.long:
      return Run(distance: 3000, type: runType);
    case RunType.race:
      return Run(distance: 10000, type: runType);
    case RunType.none:
      return Run(distance: 0, type: runType);


  }  
} 
