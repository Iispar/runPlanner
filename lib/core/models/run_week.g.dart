// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_week.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RunWeekAdapter extends TypeAdapter<RunWeek> {
  @override
  final int typeId = 2;

  @override
  RunWeek read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RunWeek(
      weekNumber: (fields[0] as num).toInt(),
      monday: fields[1] as Run,
      tuesday: fields[2] as Run,
      wednesday: fields[3] as Run,
      thursday: fields[4] as Run,
      friday: fields[5] as Run,
      saturday: fields[6] as Run,
      sunday: fields[7] as Run,
    );
  }

  @override
  void write(BinaryWriter writer, RunWeek obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.weekNumber)
      ..writeByte(1)
      ..write(obj.monday)
      ..writeByte(2)
      ..write(obj.tuesday)
      ..writeByte(3)
      ..write(obj.wednesday)
      ..writeByte(4)
      ..write(obj.thursday)
      ..writeByte(5)
      ..write(obj.friday)
      ..writeByte(6)
      ..write(obj.saturday)
      ..writeByte(7)
      ..write(obj.sunday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunWeekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
