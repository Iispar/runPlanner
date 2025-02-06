import 'dart:math';

import 'package:run_planner/core/models/run_type_week.dart';
import '../../data/models/hill_runs.dart' as hillRuns;
import '../../data/models/tempo_runs.dart' as tempoRuns;
import '../../data/models/interval_runs.dart' as intervalRuns;

import '../models/run.dart';
import '../models/run_type.dart';
import '../models/run_week.dart';

runWeekGenerator(DateTime startDate, DateTime raceDate, RunTypeWeek runTypes,
    int offWeekFrequency, int startMileage, int maxMileage) {
  List<RunWeek> weeks = [];
  int dayCount = raceDate.difference(startDate).inDays;
  int firstDate = startDate.weekday;
  int weekCount = (dayCount / 7).floor();
  int raceWeekDate = dayCount % 7;
  num currentMileage = startMileage * 1000;
  num restWeekMultiplier = 0.8;
  num longRunMultiplier = 0.35;
  num fastRunMultiplier = 0.2;
  num weeklyIncreaseMultiplier = 1.1;
  num fastRunWarmUpAndCooldown = 1000;
  int fastRunCount = 1;

  if (raceWeekDate == 0) weekCount - 1;

  num weeklyMileage = 1 % offWeekFrequency == 0
      ? currentMileage * restWeekMultiplier
      : currentMileage;

  RunCounts runCounts = runTypes.getRunCounts();
  num fastRunMileage =
      (max(weeklyMileage * fastRunMultiplier, 5002) / runCounts.fast) +
          fastRunWarmUpAndCooldown;

  num longRunMileage =
      max(weeklyMileage * longRunMultiplier, 7000) / runCounts.long;

  num slowRunMileage =
      (weeklyMileage - fastRunMileage - longRunMileage) / runCounts.slow;

  Map mileages = {
    RunType.fast: fastRunMileage,
    RunType.long: longRunMileage,
    RunType.slow: slowRunMileage,
    RunType.race: 0,
    RunType.gym: 0,
    RunType.none: 0
  };
  weeks.add(RunWeek(
    weekNumber: 1,
    monday: firstDate <= 1 ? getRunForDate(runTypes.monday, mileages[runTypes.monday],
        runTypes.monday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(RunType.none, 0, 0),
    tuesday: firstDate <= 2 ? getRunForDate(runTypes.tuesday, mileages[runTypes.tuesday],
        runTypes.tuesday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(RunType.none, 0, 0),
    wednesday: firstDate <= 3 ? getRunForDate(runTypes.wednesday, mileages[runTypes.wednesday],
        runTypes.wednesday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(RunType.none, 0, 0),
    thursday: firstDate <= 4 ? getRunForDate(runTypes.thursday, mileages[runTypes.thursday],
        runTypes.thursday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(RunType.none, 0, 0),
    friday: firstDate <= 5 ? getRunForDate(runTypes.friday, mileages[runTypes.friday],
        runTypes.friday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(RunType.none, 0, 0),
    saturday: firstDate <= 6 ? getRunForDate(runTypes.saturday, mileages[runTypes.saturday],
        runTypes.saturday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(RunType.none, 0, 0),
    sunday: firstDate <= 7 ? getRunForDate(runTypes.sunday, mileages[runTypes.sunday],
        runTypes.sunday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(RunType.none, 0, 0),
  ));

  for (int i = 2; i <= weekCount; i++) {
    num weeklyMileage = i % offWeekFrequency == 0
        ? currentMileage * restWeekMultiplier
        : currentMileage;

    RunCounts runCounts = runTypes.getRunCounts();
    num fastRunMileage =
        (max(weeklyMileage * fastRunMultiplier, 5000) / runCounts.fast) +
            fastRunWarmUpAndCooldown;
    if (runCounts.fast >= 2) fastRunMileage = max(fastRunMileage, 8000);

    num longRunMileage =
        max(weeklyMileage * longRunMultiplier, 7000) / runCounts.long;
        if (runCounts.long >= 2) longRunMileage = max(longRunMileage, 1400);

    num slowRunMileage =
        (weeklyMileage - fastRunMileage - longRunMileage) / runCounts.slow;

    Map mileages = {
      RunType.fast: fastRunMileage,
      RunType.long: longRunMileage,
      RunType.slow: slowRunMileage,
      RunType.race: 0,
      RunType.gym: 0,
      RunType.none: 0
    };

    weeks.add(RunWeek(
      weekNumber: i,
      monday: getRunForDate(runTypes.monday, mileages[runTypes.monday],
          runTypes.monday == RunType.fast ? fastRunCount++ : fastRunCount),
      tuesday: getRunForDate(runTypes.tuesday, mileages[runTypes.tuesday],
          runTypes.tuesday == RunType.fast ? fastRunCount++ : fastRunCount),
      wednesday: getRunForDate(runTypes.wednesday, mileages[runTypes.wednesday],
          runTypes.wednesday == RunType.fast ? fastRunCount++ : fastRunCount),
      thursday: getRunForDate(runTypes.thursday, mileages[runTypes.thursday],
          runTypes.thursday == RunType.fast ? fastRunCount++ : fastRunCount),
      friday: getRunForDate(runTypes.friday, mileages[runTypes.friday],
          runTypes.friday == RunType.fast ? fastRunCount++ : fastRunCount),
      saturday: getRunForDate(runTypes.saturday, mileages[runTypes.saturday],
          runTypes.saturday == RunType.fast ? fastRunCount++ : fastRunCount),
      sunday: getRunForDate(runTypes.sunday, mileages[runTypes.sunday],
          runTypes.sunday == RunType.fast ? fastRunCount++ : fastRunCount),
    ));

    currentMileage = min(
        (currentMileage * weeklyIncreaseMultiplier).round(), maxMileage * 1000);
  }

  weeklyMileage = currentMileage;
  runCounts = runTypes.getRunCounts();
  fastRunMileage =
      (max(weeklyMileage * fastRunMultiplier, 5000) / runCounts.fast) +
          fastRunWarmUpAndCooldown;
  longRunMileage =
      max(weeklyMileage * longRunMultiplier, 7000) / runCounts.long;
  slowRunMileage =
      (weeklyMileage - fastRunMileage - longRunMileage) / runCounts.slow;
  mileages = {
    RunType.fast: fastRunMileage,
    RunType.long: longRunMileage,
    RunType.slow: slowRunMileage,
    RunType.race: 0,
    RunType.gym: 0,
    RunType.none: 0
  };

  weeks.add(RunWeek(
      weekNumber: weekCount + 1,
      monday: raceWeekDate == 1
          ? getRunForDate(RunType.race, mileages[runTypes.monday],
              runTypes.monday == RunType.fast ? fastRunCount++ : fastRunCount)
          : getRunForDate(runTypes.monday, mileages[runTypes.monday],
              runTypes.monday == RunType.fast ? fastRunCount++ : fastRunCount),
      tuesday: raceWeekDate == 2
          ? getRunForDate(RunType.race, mileages[runTypes.tuesday],
              runTypes.tuesday == RunType.fast ? fastRunCount++ : fastRunCount)
          : getRunForDate(runTypes.tuesday, mileages[runTypes.tuesday],
              runTypes.tuesday == RunType.fast ? fastRunCount++ : fastRunCount),
      wednesday: raceWeekDate == 3
          ? getRunForDate(
              RunType.race,
              mileages[runTypes.wednesday],
              runTypes.wednesday == RunType.fast
                  ? fastRunCount++
                  : fastRunCount)
          : getRunForDate(
              runTypes.wednesday,
              mileages[runTypes.wednesday],
              runTypes.wednesday == RunType.fast
                  ? fastRunCount++
                  : fastRunCount),
      thursday: raceWeekDate == 4
          ? getRunForDate(RunType.race, mileages[runTypes.thursday],
              runTypes.thursday == RunType.fast ? fastRunCount++ : fastRunCount)
          : getRunForDate(
              runTypes.thursday,
              mileages[runTypes.thursday],
              runTypes.thursday == RunType.fast
                  ? fastRunCount++
                  : fastRunCount),
      friday: raceWeekDate == 5
          ? getRunForDate(RunType.race, mileages[runTypes.friday],
              runTypes.friday == RunType.fast ? fastRunCount++ : fastRunCount)
          : getRunForDate(runTypes.friday, mileages[runTypes.friday],
              runTypes.friday == RunType.fast ? fastRunCount++ : fastRunCount),
      saturday: raceWeekDate == 6
          ? getRunForDate(RunType.race, mileages[runTypes.saturday],
              runTypes.saturday == RunType.fast ? fastRunCount++ : fastRunCount)
          : getRunForDate(runTypes.saturday, mileages[runTypes.saturday], runTypes.saturday == RunType.fast ? fastRunCount++ : fastRunCount),
      sunday: raceWeekDate == 0 ? getRunForDate(RunType.race, mileages[runTypes.sunday], runTypes.sunday == RunType.fast ? fastRunCount++ : fastRunCount) : getRunForDate(runTypes.saturday, mileages[runTypes.sunday], runTypes.sunday == RunType.fast ? fastRunCount++ : fastRunCount)));

  return weeks;
}

getRunForDate(RunType runType, num mileage, int fastRunCount) {
  List<List<Run>> runLists = [hillRuns.runs, tempoRuns.runs, intervalRuns.runs];
  switch (runType) {
    case RunType.fast:
      List<Run> runs = runLists[fastRunCount % 3];
      List<Run> validRuns = runs
          .where((run) => run.getFullFastDistance() <= mileage - 2000)
          .toList();
      return validRuns[Random().nextInt(validRuns.length)];
    case RunType.slow:
      return Run(
          distance: mileage,
          type: runType,
          warmUp: 0,
          coolDown: 0,
          name: "slow ${(mileage / 1000).toStringAsFixed(1)}km");
    case RunType.long:
      return Run(
          distance: mileage,
          type: runType,
          warmUp: 0,
          coolDown: 0,
          name: "long ${(mileage / 1000).toStringAsFixed(1)}km");
    case RunType.race:
      return Run(
          distance: mileage,
          type: runType,
          warmUp: 0,
          coolDown: 0,
          name: "race ${(mileage / 1000).toStringAsFixed(1)}km");
    case RunType.none:
      return Run(
          distance: 0, type: runType, warmUp: 0, coolDown: 0, name: "off day");
    case RunType.gym:
      return Run(
          distance: 0, type: runType, warmUp: 0, coolDown: 0, name: "gym");
  }
}
