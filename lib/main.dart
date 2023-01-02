import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stat_management/provider/count_provider.dart';
import 'package:stat_management/screen/count_screen.dart';
import 'package:stat_management/screen/example_one.dart';
import 'package:stat_management/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) =>CountProvider()  ,
child:  MaterialApp(
  home: ExampleOneScreen()
),
    );
  }
}


