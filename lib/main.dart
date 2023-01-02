import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stat_management/provider/count_provider.dart';
import 'package:stat_management/provider/dark_theme_provider.dart';
import 'package:stat_management/provider/example_one_provider.dart';
import 'package:stat_management/provider/favourite_provider.dart';
import 'package:stat_management/screen/count_screen.dart';
import 'package:stat_management/screen/dark_theme.dart';
import 'package:stat_management/screen/example_one.dart';
import 'package:stat_management/screen/favourite_screen.dart';
import 'package:stat_management/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
              themeMode: themeChanger.themeMode,
              theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
              darkTheme: ThemeData(brightness: Brightness.dark,primarySwatch: Colors.lightBlue,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal
              )),
              home: DarkThemeScreen());
        }));
  }
}
