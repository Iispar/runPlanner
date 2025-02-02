// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempo_run.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TempoRunAdapter extends TypeAdapter<TempoRun> {
  @override
  final int typeId = 5;

  @override
  TempoRun read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TempoRun(
      distance: fields[1] as num,
      type: fields[2] as RunType,
      warmUp: fields[3] as num,
      coolDown: fields[4] as num,
      name: fields[0] as String,
      speed: fields[6] as String,
      slowStartDistance: fields[7] == null ? -1 : fields[7] as num,
      slowStartSpeed: fields[8] == null ? "null" : fields[8] as String,
    )..completed = fields[5] as bool;
  }

  @override
  void write(BinaryWriter writer, TempoRun obj) {
    writer
      ..writeByte(9)
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
      ..writeByte(5)
      ..write(obj.completed)
      ..writeByte(6)
      ..write(obj.speed)
      ..writeByte(7)
      ..write(obj.slowStartDistance)
      ..writeByte(8)
      ..write(obj.slowStartSpeed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempoRunAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
