library tool.dev;

import 'dart:async';
import 'package:dart_dev/dart_dev.dart' show dev, config;

Future main(List<String> args) async {
  config.analyze
    ..entryPoints = ([
      'lib/distinctly_redux.dart',
      'test/suite.dart',
    ])
    ..fatalHints = false
    ..hints = true
    ..strong = true;

  config.copyLicense.directories = ['lib'];

  config.format
    ..paths = [
      'lib',
      'test',
      'tool',
    ]
    ..lineLength = 120;

  await dev(args);
}
