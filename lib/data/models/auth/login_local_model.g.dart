// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginLocalModelAdapter extends TypeAdapter<LoginLocalModel> {
  @override
  final int typeId = 1;

  @override
  LoginLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginLocalModel(
      userId: fields[0] as int,
      email: fields[1] as String,
      fullname: fields[2] as String,
      session: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.fullname)
      ..writeByte(3)
      ..write(obj.session);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
