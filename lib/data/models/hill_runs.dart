import 'package:run_planner/core/models/run_type.dart';
import 'package:run_planner/core/models/hills_run.dart';

final List<HillsRun> runs = [
  HillsRun(
      name: "100m hills",
      distance: 800,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      workSpeed: "full",
      coolDownSpeed: "walk / light jog",
      repeatCount: 8,
      hillIncline: 16),
  HillsRun(
      name: "150m hills",
      distance: 1200,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      workSpeed: "full",
      coolDownSpeed: "walk / light jog",
      repeatCount: 8,
      hillIncline: 16),
  HillsRun(
      name: "200m hills",
      distance: 1600,
      type: RunType.fast,
      warmUp: 1000,
      coolDown: 1000,
      workSpeed: "full",
      coolDownSpeed: "walk / light jog",
      repeatCount: 8,
      hillIncline: 16)
];
