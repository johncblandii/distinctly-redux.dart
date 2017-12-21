// MIT License
//
// Copyright (c) 2017 John C. Bland II
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import 'dart:async';

import 'package:redux/redux.dart' show Middleware, Reducer, Store;

/// Creates a Redux store to hold the app state tree and dispatches [onChange] updates only when [state] has changed.
///
/// ### Basic Example
///
///     // Create a reducer
///     final increment = 'INCREMENT';
///     final decrement = 'DECREMENT';
///
///     IntState reducer(IntState state, String action) {
///       if (action == increment) {
///         return new IntState()..value = state.value + 1;
///       } else if (action == decrement) {
///         return new IntState()..value = state.value - 1;
///       }
///
///       return state;
///     }
///
///     // Create the store
///     final DistinctStore store = new DistinctStore<IntState>(reducer, initialState: new IntState()..value = 0);
///
///     // Print the Store's state.
///     print(store.state.value); // prints "0"
///
///     // Dispatch an action. This will be sent to the reducer to update the state.
///     store.dispatch(increment);
///
///     // Print the updated state.
///     print(store.state.value); // prints "1"
///
///     // As an alternative, you can use the `store.onChange.listen` to respond to non-duplicate state change events.
///     int updateCount = 0;
///     store.onChange.listen((state) => updateCount++);
///
///     store.dispatch(increment); // updateCount == 1
///     store.dispatch(decrement); // updateCount == 2
///     store.dispatch('anything'); // updateCount == 2
///     store.dispatch('anything'); // updateCount == 2
///     store.dispatch('anything'); // updateCount == 2
///     store.dispatch(decrement); // updateCount == 3
class DistinctStore<T> extends Store<T> {
  DistinctStore(Reducer<T> reducer, {T initialState, List<Middleware<T>> middleware: const [], bool syncStream: false})
      : super(reducer, initialState: initialState, middleware: middleware);

  @override
  Stream<T> get onChange => super.onChange.distinct();
}
