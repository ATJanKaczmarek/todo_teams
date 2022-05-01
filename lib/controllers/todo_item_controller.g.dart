// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToDoItemController on _ToDoItemController, Store {
  final _$completedAtom = Atom(name: '_ToDoItemController.completed');

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  final _$todoTextAtom = Atom(name: '_ToDoItemController.todoText');

  @override
  String get todoText {
    _$todoTextAtom.reportRead();
    return super.todoText;
  }

  @override
  set todoText(String value) {
    _$todoTextAtom.reportWrite(value, super.todoText, () {
      super.todoText = value;
    });
  }

  final _$colorAtom = Atom(name: '_ToDoItemController.color');

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

  final _$setToDoTextAsyncAction =
      AsyncAction('_ToDoItemController.setToDoText');

  @override
  Future setToDoText(String newText) {
    return _$setToDoTextAsyncAction.run(() => super.setToDoText(newText));
  }

  final _$_ToDoItemControllerActionController =
      ActionController(name: '_ToDoItemController');

  @override
  void toggleCompleted() {
    final _$actionInfo = _$_ToDoItemControllerActionController.startAction(
        name: '_ToDoItemController.toggleCompleted');
    try {
      return super.toggleCompleted();
    } finally {
      _$_ToDoItemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
completed: ${completed},
todoText: ${todoText},
color: ${color}
    ''';
  }
}
