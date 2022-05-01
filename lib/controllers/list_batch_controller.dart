import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_teams/services/userservice.dart';

part 'list_batch_controller.g.dart';

class ListBatchController = _ListBatchController with _$ListBatchController;

abstract class _ListBatchController with Store {
  _ListBatchController({
    this.icon,
    required this.text,
    required this.color,
  });

  @observable
  IconData? icon;

  @observable
  String text;

  @observable
  Color color;
}
