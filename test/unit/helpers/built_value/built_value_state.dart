library distinctly_redux.test_state;

import 'package:built_value/built_value.dart';

import '../test_state.dart';

part 'built_value_state.g.dart';

abstract class BuiltValueState extends TestState<int> implements Built<BuiltValueState, BuiltValueStateBuilder> {
  factory BuiltValueState({int value: 0}) =>
      new _$BuiltValueState._(value: value);

  BuiltValueState._();

  @override
  int get value;
}
