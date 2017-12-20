import 'dart:async';

import 'package:distinctly_redux/distinctly_redux.dart';

/// A simple state object for a primitive value
class IntState {
  int value;

  @override
  bool operator ==(dynamic other) => other is IntState && other.value == value;

  @override
  int get hashCode => value;

  @override
  String toString() => 'IntState(value: $value)';
}

// Basic actions
final String increment = 'INCREMENT';
final String decrement = 'DECREMENT';

// A reducer to increment/decrement the state accordingly
IntState reducer(IntState state, String action) {
  if (action == increment) {
    return new IntState()..value = state.value + 1;
  } else if (action == decrement) {
    return new IntState()..value = state.value - 1;
  }

  return state;
}

// A store reference
DistinctStore store;

// A value indicating the number of store updates
int updateCount = 0;

Future main() async {
  // Create the store
  store = new DistinctStore<IntState>(reducer, initialState: new IntState()..value = 0);

  // Print the Store's state.
  print('Value: ${store.state.value}'); // prints '0'

  // Dispatch an action. This will be sent to the reducer to update the state.
  store.dispatch(increment);

  // Print the updated state.
  print('Value: ${store.state.value}'); // prints '1'

  // As an alternative, you can use the `store.onChange.listen` to respond to non-duplicate state change events.
  store.onChange.listen((state) => updateCount++);

  // Dispatch some actions and check the count
  await dispatchAndLog(increment); // updateCount == 1
  await dispatchAndLog(decrement); // updateCount == 1
  await dispatchAndLog('anything'); // updateCount == 2
  await dispatchAndLog('other than'); // updateCount == 2
  await dispatchAndLog('inc or dec'); // updateCount == 2
  await dispatchAndLog(decrement); // updateCount == 3
}

/// A helper method to dispatch [action] and log [updateCount].
Future dispatchAndLog(String action) async {
  store.dispatch(action);
  await new Future.delayed(new Duration());

  print('Update count: $updateCount');
}
