import 'package:flutter/material.dart';
import 'package:mobilfire/src/pages/home/homePage.dart';
import 'package:mobilfire/src/pages/login/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.amber
          //fontFamily: 'Espol'
          ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
