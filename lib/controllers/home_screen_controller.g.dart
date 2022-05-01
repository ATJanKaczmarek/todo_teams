// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenController on _HomeScreenController, Store {
  final _$todoListsAtom = Atom(name: '_HomeScreenController.todoLists');

  @override
  ObservableList<ToDoListController> get todoLists {
    _$todoListsAtom.reportRead();
    return super.todoLists;
  }

  @override
  set todoLists(ObservableList<ToDoListController> value) {
    _$todoListsAtom.reportWrite(value, super.todoLists, () {
      super.todoLists = value;
    });
  }

  final _$getSavedToDoListsAsyncAction =
      AsyncAction('_HomeScreenController.getSavedToDoLists');

  @override
  Future<List<ToDoList>> getSavedToDoLists() {
    return _$getSavedToDoListsAsyncAction.run(() => super.getSavedToDoLists());
  }

  @override
  String toString() {
    return '''
todoLists: ${todoLists}
    ''';
  }
}
