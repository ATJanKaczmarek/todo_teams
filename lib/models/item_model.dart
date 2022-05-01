import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class Item {
  bool isCompleted = false;
  String text;

  Item({required this.isCompleted, required this.text});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  static String jsonArray(List<dynamic> listEntries) {
    String jsonified = jsonEncode(listEntries);
    return jsonified;
  }
}
