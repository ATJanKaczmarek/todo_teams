// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todolist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoList _$ToDoListFromJson(Map<String, dynamic> json) => ToDoList(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$ToDoListToJson(ToDoList instance) => <String, dynamic>{
      'name': instance.name,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'color': instance.color,
    };
