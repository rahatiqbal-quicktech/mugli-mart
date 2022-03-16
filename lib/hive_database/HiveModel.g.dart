// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishListAdapter extends TypeAdapter<WishList> {
  @override
  final int typeId = 0;

  @override
  WishList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishList(
      name: fields[0] as String,
      id: fields[1] as String,
      price: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
