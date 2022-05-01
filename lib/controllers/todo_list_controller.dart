import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:todo_teams/controllers/todo_item_controller.dart';
import 'package:todo_teams/models/item_model.dart';
import 'package:todo_teams/models/todolist_model.dart';
import 'package:todo_teams/models/user_model.dart';
import 'package:todo_teams/services/userservice.dart';

part 'todo_list_controller.g.dart';

class ToDoListController = _ToDoListController with _$ToDoListController;

abstract class _ToDoListController with Store {
  _ToDoListController({
    required this.color,
    required this.todos,
    required this.name,
  });

  @observable
  ObservableList<ToDoItemController> todos =
      ObservableList<ToDoItemController>();

  @observable
  Color color;

  @observable
  String name;

  @observable
  double xPos = 0;

  @observable
  bool isSlidOut = false;

  @action
  int getLength() {
    return todos.length;
  }

  @action
  void createTodo() {
    ToDoItemController newToDo = ToDoItemController(
      todoText: "Test",
      completed: false,
      color: color,
      onSaveChanges: updateListWithNewValue,
      uid: DateTime.now().toString(),
    );
    todos.add(newToDo);
  }

  @action
  setColor(String clrValue) {
    color = Color(int.parse("0xFF$clrValue"));
  }

  @action
  void updateX(double deltaX) {
    // xPos += deltaX;
    xPos += deltaX * 1.2;
    xPos = xPos.clamp(0.0, 90.0);
  }

  @action
  void snap() {
    double thresholdLeft = 30.0; //  Variable for sliding Out
    double thresholdRight = 60.0; //  Variable for sliding In
    double slidOutPos = 90.0; //  Variable for slid-out Position

    if (!isSlidOut && xPos < thresholdLeft) {
      xPos = 0;
      isSlidOut = false;
      return;
    }
    if (!isSlidOut && xPos > thresholdLeft) {
      xPos = slidOutPos;
      isSlidOut = true;
      return;
    }
    if (isSlidOut && xPos > thresholdRight) {
      xPos = slidOutPos;
      isSlidOut = true;
      return;
    }
    isSlidOut = false;
    xPos = 0;
  }

  @action
  void navigateToEditingScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/second',
        arguments: ToDoListController(color: color, todos: todos, name: name));
  }

  @action
  Future<void> updateList() async {
    print("CALLED");
    List<Item> newItems = [];
    for (ToDoItemController toDoItem in todos) {
      newItems.add(
        Item(isCompleted: toDoItem.completed, text: toDoItem.todoText),
      );
    }

    UserService service = UserService();
    await service.getUserFromFirebase();

    await service
        .updateUserList(ToDoList(name: name, items: newItems, color: "845EC2"))
        .then((todos) =>
            ToDoList(name: name, items: newItems, color: "845EC2").items);
  }

  @action
  Future<void> updateListWithNewValue(String newText, String uid) async {
    print("Called to update, UID: " + uid);
    List<Item> newItems = [];

    for (ToDoItemController toDoItem in todos) {
      if (uid == toDoItem.uid) {
        newItems.add(
          Item(isCompleted: toDoItem.completed, text: newText),
        );
        continue;
      }
      newItems.add(
        Item(isCompleted: toDoItem.completed, text: toDoItem.todoText),
      );
    }

    UserService service = UserService();
    await service.getUserFromFirebase();

    await service
        .updateUserList(ToDoList(name: name, items: newItems, color: "845EC2"))
        .then((todos) =>
            ToDoList(name: name, items: newItems, color: "845EC2").items);
  }

  // Helper Functions

  Color convertColor(String clrValue) {
    return Color(int.parse("0xFF$clrValue"));
  }

  void onInit() {
    print("INIT");
  }

  void replace(String uid, String text) {
    ObservableList<ToDoItemController> newItems = ObservableList<ToDoItemController>();

    for (ToDoItemController toDoItem in todos) {
      if (uid == toDoItem.uid) {
        newItems.add(
          ToDoItemController(color: toDoItem.color, uid: toDoItem.uid, completed: toDoItem.completed, todoText: text),
        );
        continue;
      }
      newItems.add(
        ToDoItemController(color: toDoItem.color, uid: toDoItem.uid, completed: toDoItem.completed, todoText: toDoItem.todoText),
      );
    }

    todos = newItems;
  }
}
