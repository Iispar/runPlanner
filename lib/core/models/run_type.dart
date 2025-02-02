import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
part "run_type.g.dart";

@HiveType(typeId: 4, adapterName: "RunTypeAdapter")
enum RunType {
  @HiveField(0)
  slow,
  @HiveField(1)
  fast,
  @HiveField(2)
  long,
  @HiveField(3)
  race,
  @HiveField(4)
  gym,
  @HiveField(5)
  none;

  String get value {
    switch (this) {
      case RunType.fast:
        return "Fast run";
      case RunType.slow:
        return "Slow run";
      case RunType.long:
        return "Long run";
      case RunType.race:
        return "Race";
      case RunType.gym:
        return "Gym";
      case RunType.none:
        return "Off day";
    }
  }
}
