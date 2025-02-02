// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RunTypeAdapter extends TypeAdapter<RunType> {
  @override
  final int typeId = 4;

  @override
  RunType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RunType.slow;
      case 1:
        return RunType.fast;
      case 2:
        return RunType.long;
      case 3:
        return RunType.race;
      case 4:
        return RunType.gym;
      case 5:
        return RunType.none;
      default:
        return RunType.slow;
    }
  }

  @override
  void write(BinaryWriter writer, RunType obj) {
    switch (obj) {
      case RunType.slow:
        writer.writeByte(0);
      case RunType.fast:
        writer.writeByte(1);
      case RunType.long:
        writer.writeByte(2);
      case RunType.race:
        writer.writeByte(3);
      case RunType.gym:
        writer.writeByte(4);
      case RunType.none:
        writer.writeByte(5);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
