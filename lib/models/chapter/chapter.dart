import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Chapter{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? chapterTitle;

  @HiveField(2)
  String? content;
  Chapter({this.id, this.chapterTitle, this.content});

  Chapter.fromJson(Map<String, dynamic> json){
    id = json[id];
    chapterTitle = json['chapterTitle'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() => {
    if(id != null) 'id': id,
    if(chapterTitle != null) 'chapterTitle': chapterTitle,
    if(content != null) 'content': content,
  };
}

class ChapterAdapter extends TypeAdapter<Chapter>{
  @override
  Chapter read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chapter(
      id: fields[0] as String,
      chapterTitle: fields[1] as String,
      content: fields[2] as String,
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Chapter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chapterTitle)
      ..writeByte(2)
      ..write(obj.content);
  }

}