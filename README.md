# Distinctly Redux

[Redux for Dart](https://github.com/johnpryan/redux.dart), like the JS counterpart, dispatches change notifications on every change in the store. Distinctly Redux provides a drop-in replacement of Redux.dart's Store with `onChange` notifications only when the state is distinct.

## Example

Run `dart example/index.dart`:

```
$ dart example/index.dart
Value: 0
Value: 1
Update count: 1
Update count: 2
Update count: 2
Update count: 2
Update count: 2
Update count: 3
```

See [example/index.dart](example/index.dart) to review the code used to generate the amount. The repeated `2` count shows the `onChange` not triggering when the state is not mutated.

The tests provide clear examples of different state object types as well.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/johncblandii/distinctly-redux.dart/issues

## Contributing

Please do. ;) Write new or update current tests for any changes.

## Immutability

[BuiltValue](https://github.com/google/built_value.dart/) is an immutable Dart library with built-in equality checks. This makes it easy to check for Redux state changes in when your state is a BuiltValue object.

See [test/unit/built_value_state_test.dart] for an example of using the BuiltValue with Distinctly Redux.

### Building

Run `dart tool/gen-built_value.dart` to update BuiltValue files used in testing.
