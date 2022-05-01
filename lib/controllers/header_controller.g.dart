// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeaderController on _HeaderController, Store {
  Computed<String>? _$headerTextComputed;

  @override
  String get headerText =>
      (_$headerTextComputed ??= Computed<String>(() => super.headerText,
              name: '_HeaderController.headerText'))
          .value;
  Computed<String>? _$subHeaderTextComputed;

  @override
  String get subHeaderText =>
      (_$subHeaderTextComputed ??= Computed<String>(() => super.subHeaderText,
              name: '_HeaderController.subHeaderText'))
          .value;
  Computed<String>? _$highlightedTextComputed;

  @override
  String get highlightedText => (_$highlightedTextComputed ??= Computed<String>(
          () => super.highlightedText,
          name: '_HeaderController.highlightedText'))
      .value;

  final _$currentTypeAtom = Atom(name: '_HeaderController.currentType');

  @override
  HeaderType get currentType {
    _$currentTypeAtom.reportRead();
    return super.currentType;
  }

  @override
  set currentType(HeaderType value) {
    _$currentTypeAtom.reportWrite(value, super.currentType, () {
      super.currentType = value;
    });
  }

  final _$getUsernameAsyncAction = AsyncAction('_HeaderController.getUsername');

  @override
  Future<String> getUsername() {
    return _$getUsernameAsyncAction.run(() => super.getUsername());
  }

  @override
  String toString() {
    return '''
currentType: ${currentType},
headerText: ${headerText},
subHeaderText: ${subHeaderText},
highlightedText: ${highlightedText}
    ''';
  }
}
