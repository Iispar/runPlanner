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

  getRunCounts() {
    int slow = 0;
    int fast = 0;
    int long = 0;
    if (monday == RunType.slow) slow += 1;
    if (monday == RunType.fast) fast += 1;
    if (monday == RunType.long) long += 1;

    if (tuesday == RunType.slow) slow += 1;
    if (tuesday == RunType.fast) fast += 1;
    if (tuesday == RunType.long) long += 1;

    if (wednesday == RunType.slow) slow += 1;
    if (wednesday == RunType.fast) fast += 1;
    if (wednesday == RunType.long) long += 1;

    if (thursday == RunType.slow) slow += 1;
    if (thursday == RunType.fast) fast += 1;
    if (thursday == RunType.long) long += 1;

    if (friday == RunType.slow) slow += 1;
    if (friday == RunType.fast) fast += 1;
    if (friday == RunType.long) long += 1;

    if (saturday == RunType.slow) slow += 1;
    if (saturday == RunType.fast) fast += 1;
    if (saturday == RunType.long) long += 1;

    if (sunday == RunType.slow) slow += 1;
    if (sunday == RunType.fast) fast += 1;
    if (sunday == RunType.long) long += 1;

    return RunCounts(slow: slow, fast: fast, long: long);
  }
}

class RunCounts {
  const RunCounts({
    required this.slow,
    required this.fast,
    required this.long
  });

  final int slow;
  final int fast;
  final int long;
}
