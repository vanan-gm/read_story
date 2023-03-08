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