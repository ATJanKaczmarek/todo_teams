// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToDoListController on _ToDoListController, Store {
  final _$todosAtom = Atom(name: '_ToDoListController.todos');

  @override
  ObservableList<ToDoItemController> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<ToDoItemController> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$colorAtom = Atom(name: '_ToDoListController.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$nameAtom = Atom(name: '_ToDoListController.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$xPosAtom = Atom(name: '_ToDoListController.xPos');

  @override
  double get xPos {
    _$xPosAtom.reportRead();
    return super.xPos;
  }

  @override
  set xPos(double value) {
    _$xPosAtom.reportWrite(value, super.xPos, () {
      super.xPos = value;
    });
  }

  final _$isSlidOutAtom = Atom(name: '_ToDoListController.isSlidOut');

  @override
  bool get isSlidOut {
    _$isSlidOutAtom.reportRead();
    return super.isSlidOut;
  }

  @override
  set isSlidOut(bool value) {
    _$isSlidOutAtom.reportWrite(value, super.isSlidOut, () {
      super.isSlidOut = value;
    });
  }

  final _$updateListAsyncAction = AsyncAction('_ToDoListController.updateList');

  @override
  Future<void> updateList() {
    return _$updateListAsyncAction.run(() => super.updateList());
  }

  final _$updateListWithNewValueAsyncAction =
      AsyncAction('_ToDoListController.updateListWithNewValue');

  @override
  Future<void> updateListWithNewValue(String newText, String uid) {
    return _$updateListWithNewValueAsyncAction
        .run(() => super.updateListWithNewValue(newText, uid));
  }

  final _$_ToDoListControllerActionController =
      ActionController(name: '_ToDoListController');

  @override
  int getLength() {
    final _$actionInfo = _$_ToDoListControllerActionController.startAction(
        name: '_ToDoListController.getLength');
    try {
      return super.getLength();
    } finally {
      _$_ToDoListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createTodo() {
    final _$actionInfo = _$_ToDoListControllerActionController.startAction(
        name: '_ToDoListController.createTodo');
    try {
      return super.createTodo();
    } finally {
      _$_ToDoListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setColor(String clrValue) {
    final _$actionInfo = _$_ToDoListControllerActionController.startAction(
        name: '_ToDoListController.setColor');
    try {
      return super.setColor(clrValue);
    } finally {
      _$_ToDoListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateX(double deltaX) {
    final _$actionInfo = _$_ToDoListControllerActionController.startAction(
        name: '_ToDoListController.updateX');
    try {
      return super.updateX(deltaX);
    } finally {
      _$_ToDoListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void snap() {
    final _$actionInfo = _$_ToDoListControllerActionController.startAction(
        name: '_ToDoListController.snap');
    try {
      return super.snap();
    } finally {
      _$_ToDoListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToEditingScreen(BuildContext context) {
    final _$actionInfo = _$_ToDoListControllerActionController.startAction(
        name: '_ToDoListController.navigateToEditingScreen');
    try {
      return super.navigateToEditingScreen(context);
    } finally {
      _$_ToDoListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
color: ${color},
name: ${name},
xPos: ${xPos},
isSlidOut: ${isSlidOut}
    ''';
  }
}
