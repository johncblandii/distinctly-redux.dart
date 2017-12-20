import '../test_actions.dart';
import 'built_value_state.dart';

BuiltValueState builtValueReducer(BuiltValueState state, TestActions action) {
  if (action == TestActions.increment) {
    return state.rebuild((BuiltValueStateBuilder builder) => builder.value = builder.value + 1);
  } else if (action == TestActions.decrement) {
    return state.rebuild((BuiltValueStateBuilder builder) => builder.value = builder.value - 1);
  }

  return state;
}
