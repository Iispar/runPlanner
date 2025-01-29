
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
  none,
}