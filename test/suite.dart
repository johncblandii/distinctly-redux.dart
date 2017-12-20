@TestOn('vm')
library test.distinctly_redux;

import 'package:test/test.dart';

import 'unit/built_value_state_test.dart' as unit_built_value_state_test;
import 'unit/primitive_state_test.dart' as unit_primitive_state_test;

void main() {
  unit_built_value_state_test.main();
  unit_primitive_state_test.main();
}
