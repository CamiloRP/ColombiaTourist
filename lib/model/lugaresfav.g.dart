// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lugaresfav.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LugaresFavAdapter extends TypeAdapter<LugaresFav> {
  @override
  final int typeId = 0;

  @override
  LugaresFav read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LugaresFav()
      ..nombre_guia = fields[0] as String?
      ..apellido_guia = fields[1] as String?
      ..correo = fields[2] as String?
      ..celular = fields[3] as String?
      ..lugar = fields[4] as String?
      ..zona = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, LugaresFav obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nombre_guia)
      ..writeByte(1)
      ..write(obj.apellido_guia)
      ..writeByte(2)
      ..write(obj.correo)
      ..writeByte(3)
      ..write(obj.celular)
      ..writeByte(4)
      ..write(obj.lugar)
      ..writeByte(5)
      ..write(obj.zona);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LugaresFavAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
