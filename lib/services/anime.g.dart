part of 'anime.dart';

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  Anime read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      id: fields[0] as String,
      strings: fields[3] as String,
      startQuestionId: fields[1] as String,
      questions: fields[2] as List<Questions>,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.startQuestionId)
      ..writeByte(2)
      ..write(obj.questions)
      ..writeByte(3)
      ..write(obj.strings);
  }

  @override
  int get typeId => 0;
}
