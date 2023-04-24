// ignore_for_file: use_build_context_synchronously, unused_local_variable, unused_catch_clause

import 'package:flutter/material.dart';
import 'package:race_deep_learning_model/screens/race.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Race(),
    ),
  );
}
