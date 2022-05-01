import 'dart:ui';

import 'package:mobx/mobx.dart';

part 'todo_item_controller.g.dart';

class ToDoItemController = _ToDoItemController with _$ToDoItemController;

abstract class _ToDoItemController with Store {
  _ToDoItemController({
    required this.completed,
    required this.todoText,
    required this.color,
    required this.uid,
    this.onSaveChanges,
  });

  final Function? onSaveChanges;

  String uid;

  @observable
  bool completed;

  @observable
  String todoText;

  @observable
  Color color;

  @action
  void toggleCompleted() {
    completed = !completed;
  }

  /* setToDoText:
   * works as a middleman between the onSaveChanges
   * 
   * 
   * 
   * 
   * 
   *
   */

  @action
  setToDoText(String newText) async {
    await onSaveChanges!(newText, uid);
    todoText = newText;
  }

  // @action
  // void setUid() {
  //   if (_uid == "") {
  //     _uid = DateTime.now().toString();
  //     print("New UID is: " + _uid);
  //   }
  // }

  // String getUid() {
  //   return _uid;
  // }
}
