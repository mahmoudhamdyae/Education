// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonAdapter extends TypeAdapter<Lesson> {
  @override
  final int typeId = 1;

  @override
  Lesson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lesson(
      fields[20] as int,
      fields[21] as String,
      fields[22] as String,
      fields[23] as String,
      fields[24] as String,
      fields[25] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Lesson obj) {
    writer
      ..writeByte(6)
      ..writeByte(20)
      ..write(obj.id)
      ..writeByte(21)
      ..write(obj.title)
      ..writeByte(22)
      ..write(obj.link)
      ..writeByte(23)
      ..write(obj.pdf)
      ..writeByte(24)
      ..write(obj.type)
      ..writeByte(25)
      ..write(obj.tutorialId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
