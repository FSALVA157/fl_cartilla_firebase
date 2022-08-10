import 'package:cartilla_firebase_fl/pages/details_page.dart';
import 'package:cartilla_firebase_fl/pages/home_page.dart';
import 'package:cartilla_firebase_fl/providers/dni_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(CartillaAppState());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'details': (_) => DetailsScreen()},
        theme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(color: Colors.blueGrey),
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.white)));
  }
}

class CartillaAppState extends StatelessWidget {
  const CartillaAppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: MyApp(), providers: [
      ChangeNotifierProvider(
        create: (context) => DniProvider(),
        lazy: false,
      )
    ]);
  }
}
