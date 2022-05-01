import 'package:json_annotation/json_annotation.dart';

import 'item_model.dart';
import 'todolist_model.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String name;
  List<ToDoList> todolists;

  User({
    required this.name,
    required this.todolists,
  });

  static List<ToDoList> fromJsonArray(List<dynamic> jsonArray) {
    List<ToDoList> toDoListsFromJson = [];

    jsonArray.forEach((jsonData) {
      toDoListsFromJson.add(ToDoList.fromJson(jsonData));
    });

    return toDoListsFromJson;
  }

  static String toJsonArray(List<ToDoList> listArray) {
    return listArray.toString();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  // factory User.fromJson(Map<String, dynamic> json) {

  //   return User(
  //     name: json['name'],
  //     imgName: json['imgName'],
  //     subCategories: SubCategory.fromJsonArray(json['subCategories'])
  //   );
  // }
}
