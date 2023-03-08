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