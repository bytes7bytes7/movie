import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:quick_quotes_quill/console_quill.dart';
import 'package:quick_quotes_quill/spread_quill_manager.dart';

import 'app.dart';

void main() async {
  await initHiveForFlutter();
  await SpreadQuillManager.inst.initialize(
    [
      ConsoleQuill('App')..info('Logger is enabled'),
    ],
  );
  runApp(const App());
}
