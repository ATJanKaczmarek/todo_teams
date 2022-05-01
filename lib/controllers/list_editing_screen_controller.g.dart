// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_editing_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListEditingScreenController on _ListEditingScreenController, Store {
  final _$passedToDoListAtom =
      Atom(name: '_ListEditingScreenController.passedToDoList');

  @override
  ToDoListController get passedToDoList {
    _$passedToDoListAtom.reportRead();
    return super.passedToDoList;
  }

  @override
  set passedToDoList(ToDoListController value) {
    _$passedToDoListAtom.reportWrite(value, super.passedToDoList, () {
      super.passedToDoList = value;
    });
  }

  final _$_ListEditingScreenControllerActionController =
      ActionController(name: '_ListEditingScreenController');

  @override
  void updateListAfterChange(String textNew, String uid) {
    final _$actionInfo =
        _$_ListEditingScreenControllerActionController.startAction(
            name: '_ListEditingScreenController.updateListAfterChange');
    try {
      return super.updateListAfterChange(textNew, uid);
    } finally {
      _$_ListEditingScreenControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passedToDoList: ${passedToDoList}
    ''';
  }
}
