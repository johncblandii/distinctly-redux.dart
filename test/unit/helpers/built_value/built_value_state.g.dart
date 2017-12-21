// GENERATED CODE - DO NOT MODIFY BY HAND

part of distinctly_redux.test_state;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$BuiltValueState extends BuiltValueState {
  @override
  final int value;

  factory _$BuiltValueState([void updates(BuiltValueStateBuilder b)]) =>
      (new BuiltValueStateBuilder()..update(updates)).build();

  _$BuiltValueState._({this.value}) : super._() {
    if (value == null) throw new ArgumentError.notNull('value');
  }

  @override
  BuiltValueState rebuild(void updates(BuiltValueStateBuilder b)) => (toBuilder()..update(updates)).build();

  @override
  BuiltValueStateBuilder toBuilder() => new BuiltValueStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BuiltValueState) return false;
    return value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltValueState')..add('value', value)).toString();
  }
}

class BuiltValueStateBuilder implements Builder<BuiltValueState, BuiltValueStateBuilder> {
  _$BuiltValueState _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  BuiltValueStateBuilder();

  BuiltValueStateBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltValueState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$BuiltValueState;
  }

  @override
  void update(void updates(BuiltValueStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltValueState build() {
    final _$result = _$v ?? new _$BuiltValueState._(value: value);
    replace(_$result);
    return _$result;
  }
}
