// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_batch_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListBatchController on _ListBatchController, Store {
  final _$iconAtom = Atom(name: '_ListBatchController.icon');

  @override
  IconData? get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(IconData? value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  final _$textAtom = Atom(name: '_ListBatchController.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$colorAtom = Atom(name: '_ListBatchController.color');

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

  @override
  String toString() {
    return '''
icon: ${icon},
text: ${text},
color: ${color}
    ''';
  }
}
