import 'package:hive_ce_flutter/hive_flutter.dart';

part "distance_type.g.dart";

@HiveType(typeId: 1, adapterName: "DistanceAdapter")
enum DistanceType {
  @HiveField(0)
  five,
  @HiveField(1)
  ten,
  @HiveField(2)
  half,
  @HiveField(3)
  full;

  String get value {
    switch (this) {
      case DistanceType.five:
        return "5k";
      case DistanceType.ten:
        return "10k";
      case DistanceType.half:
        return "Half marathon";
      case DistanceType.full:
        return "Marathon";
    }
  }
}
