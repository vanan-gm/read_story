import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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

class CategoryAdapter extends TypeAdapter<Category>{
  @override
  Category read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] as Uint8List,
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image);
  }

}