// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interval_run.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IntervalRunAdapter extends TypeAdapter<IntervalRun> {
  @override
  final int typeId = 7;

  @override
  IntervalRun read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntervalRun(
      distance: fields[1] as num,
      type: fields[2] as RunType,
      warmUp: fields[3] as num,
      coolDown: fields[4] as num,
      name: fields[0] as String,
      workSpeed: fields[6] as String,
      coolDownSpeed: fields[9] as String,
      repeatCount: (fields[12] as num).toInt(),
      workDistance: fields[8] == null ? -1 : fields[8] as num,
      workTime: fields[7] == null ? -1 : fields[7] as num,
      coolDownDistance: fields[11] == null ? -1 : fields[11] as num,
      coolDownTime: fields[10] == null ? -1 : fields[10] as num,
    );
  }

  @override
  void write(BinaryWriter writer, IntervalRun obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.distance)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.warmUp)
      ..writeByte(4)
      ..write(obj.coolDown)
      ..writeByte(6)
      ..write(obj.workSpeed)
      ..writeByte(7)
      ..write(obj.workTime)
      ..writeByte(8)
      ..write(obj.workDistance)
      ..writeByte(9)
      ..write(obj.coolDownSpeed)
      ..writeByte(10)
      ..write(obj.coolDownTime)
      ..writeByte(11)
      ..write(obj.coolDownDistance)
      ..writeByte(12)
      ..write(obj.repeatCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntervalRunAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
