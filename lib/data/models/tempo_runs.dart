import 'package:run_planner/core/models/run_type.dart';
import 'package:run_planner/core/models/tempo_run.dart';

final List<TempoRun> runs = [
  TempoRun(
      name: "tempo 3k",
      distance: 3000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "5k speed + 30sec"),
  TempoRun(
      name: "tempo 5k",
      distance: 5000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "5k speed + 30sec"),
  TempoRun(
      name: "tempo 7k",
      distance: 7000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "5k speed + 35sec"),
  TempoRun(
      name: "tempo 8k",
      distance: 8000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "5k speed + 40sec"),
  TempoRun(
      name: "tempo 9k",
      distance: 9000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "5k speed + 50sec"),
  TempoRun(
      name: "tempo 10k",
      distance: 10000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "10k speed + 30sec"),
  TempoRun(
      name: "tempo 11k",
      distance: 11000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "10k speed + 35sec"),
  TempoRun(
      name: "tempo 12k",
      distance: 12000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "10k speed + 40sec"),
  TempoRun(
      name: "tempo 12k with slow2k",
      distance: 12000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "10k speed + 40sec",
      slowStartDistance: 2000,
      slowStartSpeed: "zone 2"),
  TempoRun(
      name: "tempo 12k with slow3k",
      distance: 12000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "10k speed + 40sec",
      slowStartDistance: 3000,
      slowStartSpeed: "zone 2"),
  TempoRun(
      name: "tempo 12k withS slow4k",
      distance: 12000,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      speed: "10k speed + 40sec",
      slowStartDistance: 3000,
      slowStartSpeed: "zone 2" )
];
