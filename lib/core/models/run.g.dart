// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RunAdapter extends TypeAdapter<Run> {
  @override
  final int typeId = 3;

  @override
  Run read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Run(
      distance: fields[1] as num,
      type: fields[2] as RunType,
      warmUp: fields[3] as num,
      coolDown: fields[4] as num,
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Run obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.distance)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.warmUp)
      ..writeByte(4)
      ..write(obj.coolDown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
