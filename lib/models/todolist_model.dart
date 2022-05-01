import 'dart:convert';
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import 'item_model.dart';

part 'todolist_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ToDoList {
  String name;
  List<Item> items;

  String color;

  ToDoList({
    required this.name,
    required this.items,
    required this.color,
  });

  static List<Item> fromJsonArray(List<dynamic> jsonArray) {
    List<Item> itemListFromJson = [];

    jsonArray.forEach((jsonData) {
      itemListFromJson.add(Item.fromJson(jsonData));
      // print(jsonData);
      // print(jsonData);
    });

    return itemListFromJson;
  }

  // JSON generated

  factory ToDoList.fromJson(Map<String, dynamic> json) =>
      _$ToDoListFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoListToJson(this);

  static String jsonArray(List<dynamic> listEntries) {
    String jsonified = jsonEncode(listEntries);
    return jsonified;
  }
}
