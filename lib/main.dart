import 'package:cartilla_flutter/pages/details_page.dart';
import 'package:cartilla_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'details': (_) => DetailsScreen()},
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(color: Colors.deepPurple),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)));
  }
}
