import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:todo_teams/controllers/todo_item_controller.dart';
import 'package:todo_teams/controllers/todo_list_controller.dart';
import 'package:todo_teams/models/item_model.dart';
import 'package:todo_teams/models/todolist_model.dart';
import 'package:todo_teams/services/userservice.dart';

part 'home_screen_controller.g.dart';

class HomeScreenController = _HomeScreenController with _$HomeScreenController;

abstract class _HomeScreenController with Store {
  @observable
  ObservableList<ToDoListController> todoLists =
      ObservableList<ToDoListController>();

  ///////////////////////////////
  // INITIALIZES ALL TODOLISTS //
  ///////////////////////////////
  @action
  Future<List<ToDoList>> getSavedToDoLists() async {
    UserService service = UserService();
    await service.getUserFromFirebase();

    List<ToDoList> savedTodoLists = service.getToDoLists();

    for (ToDoList todolist in savedTodoLists) {
      ToDoListController current = ToDoListController(
        color: Color(0xFFFFFFFF),
        todos: ObservableList<ToDoItemController>(),
        name: todolist.name,
      );

      current.setColor(todolist.color);
      for (Item toDoItem in todolist.items) {
        current.todos.add(ToDoItemController(
          completed: toDoItem.isCompleted,
          todoText: toDoItem.text,
          color: current.color,
          uid: DateTime.now().toString(),
        ));
      }
      todoLists.add(current);
    }

    return savedTodoLists;
  }
}
