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

import 'package:distinctly_redux/distinctly_redux.dart';
import 'package:test/test.dart';

import 'helpers/helpers.dart';

/// A simple state object for a primitive value
class IntState extends TestState<int> {
  @override
  int value;

  @override
  bool operator ==(dynamic other) => other is IntState && other.value == value;

  @override
  int get hashCode => value;

  @override
  String toString() => 'IntState(value: $value)';
}

/// A reducer for [IntState]
IntState intStateReducer(IntState state, TestActions action) {
  // The only important part is that you should not mutate the state object, but return a new object if the state changes.
  if (action == TestActions.increment) {
    return new IntState()..value = state.value + 1;
  } else if (action == TestActions.decrement) {
    return new IntState()..value = state.value - 1;
  }

  return state;
}

void main() {
  group('DistinctStore with IntState class', () {
    test('dispatches onChange on distinct state updates', () async {
      IntState initialState = new IntState()..value = 0;

      var store = new DistinctStore<IntState>(intStateReducer, initialState: initialState);

      await commonStoreTests<IntState>(store);
    });
  });
}
