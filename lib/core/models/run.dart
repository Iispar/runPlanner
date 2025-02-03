import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:run_planner/core/models/distance_type.dart';
import 'run_type.dart';

part "run.g.dart";

@HiveType(typeId: 3, adapterName: "RunAdapter")
class Run {
  Run({
    required this.distance,
    required this.type,
    required this.warmUp,
    required this.coolDown,
    required this.name,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final num distance;
  @HiveField(2)
  final RunType type;
  @HiveField(3)
  final num warmUp;
  @HiveField(4)
  final num coolDown;
  @HiveField(5)
  late bool completed = false;

  getFullFastDistance() {
    return distance;
  }

  getFullDistance() {
    return distance;
  }
}
