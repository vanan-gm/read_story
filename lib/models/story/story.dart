import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:read_story/models/models.dart';

@HiveType(typeId: 2)
class Story extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  Uint8List? image;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? categoryId;

  @HiveField(5)
  List<Chapter>? chapters;

  @HiveField(6)
  int? createdAt;
  Story({this.id, this.name, this.image, this.description, this.categoryId, this.chapters, this.createdAt});

  Story.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    categoryId = json['categoryId'];
    chapters = List.from(json['chapters']).map((item) => Chapter.fromJson(item)).toList();
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() => {
    if(id != null) 'id': id,
    if(name != null) 'name': name,
    if(image != null) 'image': image,
    if(description != null) 'description': description,
    if(categoryId != null) 'categoryId': categoryId,
    if(chapters != null) 'chapters': chapters!.map((item) => item.toJson()).toList(),
    if(createdAt != null) 'createdAt': createdAt,
  };
}

class StoryAdapter extends TypeAdapter<Story>{
  @override
  Story read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Story(
      id: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] as Uint8List,
      description: fields[3] as String,
      categoryId: fields[4] as String,
      chapters: fields[5] as List<Chapter>,
      createdAt: fields[6] as int,
    );
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, Story obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.categoryId)
      ..writeByte(5)
      ..write(obj.chapters)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

}