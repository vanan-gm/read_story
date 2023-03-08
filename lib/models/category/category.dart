import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Category{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  Uint8List? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() => {
    if(id != null) 'id': id,
    if(name != null) 'name': name,
    if(image != null) 'image': image,
  };
}