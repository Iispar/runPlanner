// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DistanceAdapter extends TypeAdapter<DistanceType> {
  @override
  final int typeId = 1;

  @override
  DistanceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DistanceType.five;
      case 1:
        return DistanceType.ten;
      case 2:
        return DistanceType.half;
      case 3:
        return DistanceType.full;
      default:
        return DistanceType.five;
    }
  }

  @override
  void write(BinaryWriter writer, DistanceType obj) {
    switch (obj) {
      case DistanceType.five:
        writer.writeByte(0);
      case DistanceType.ten:
        writer.writeByte(1);
      case DistanceType.half:
        writer.writeByte(2);
      case DistanceType.full:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DistanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
