import 'dart:async';

import 'package:distinctly_redux/distinctly_redux.dart';
import 'package:test/test.dart';
import 'test_actions.dart';
import 'test_state.dart';

Future commonStoreTests<T extends TestState>(DistinctStore<T> store) async {
  int stateUpdateCount = 0;

  store.onChange.listen((T state) {
    stateUpdateCount++;
  });

  expect(stateUpdateCount, 0);

  store.dispatch(TestActions.increment);
  await new Future.delayed(new Duration(milliseconds: 0));
  expect(stateUpdateCount, 1);
  expect(store.state.value, 1);

  store.dispatch(TestActions.decrement);
  await new Future.delayed(new Duration(milliseconds: 0));
  expect(stateUpdateCount, 2);
  expect(store.state.value, 0);

  // non-state changing action here
  store.dispatch(TestActions.benign);
  await new Future.delayed(new Duration(milliseconds: 0));
  expect(stateUpdateCount, 2);
  expect(store.state.value, 0);

  // non-state changing action here, again just to be extra sure ;)
  store.dispatch(TestActions.benign);
  await new Future.delayed(new Duration(milliseconds: 0));
  expect(stateUpdateCount, 2);
  expect(store.state.value, 0);
}
