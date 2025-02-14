// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlanAdapter extends TypeAdapter<Plan> {
  @override
  final int typeId = 0;

  @override
  Plan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plan(
      id: (fields[12] as num).toInt(),
      name: fields[0] as String,
      startDate: fields[1] as DateTime,
      raceDate: fields[2] as DateTime,
      startMileage: (fields[3] as num).toInt(),
      maxMileage: (fields[4] as num).toInt(),
      offWeekFrequency: (fields[5] as num).toInt(),
      distance: fields[6] as DistanceType,
      runWeeks: (fields[7] as List).cast<RunWeek>(),
    )
      ..totalMileage = fields[8] as num
      ..currentDistance = fields[9] as num
      ..currentWeek = (fields[10] as num).toInt()
      ..active = fields[11] as bool;
  }

  @override
  void write(BinaryWriter writer, Plan obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.raceDate)
      ..writeByte(3)
      ..write(obj.startMileage)
      ..writeByte(4)
      ..write(obj.maxMileage)
      ..writeByte(5)
      ..write(obj.offWeekFrequency)
      ..writeByte(6)
      ..write(obj.distance)
      ..writeByte(7)
      ..write(obj.runWeeks)
      ..writeByte(8)
      ..write(obj.totalMileage)
      ..writeByte(9)
      ..write(obj.currentDistance)
      ..writeByte(10)
      ..write(obj.currentWeek)
      ..writeByte(11)
      ..write(obj.active)
      ..writeByte(12)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
