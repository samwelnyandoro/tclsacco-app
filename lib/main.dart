import 'package:flutter/material.dart';

import 'auth/login.dart';
import 'utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sacco',
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Sacco')
        ),
        body: Center(
          child: Login()
          )
      ),
      routes: routes,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(52, 79, 159, 1),
        accentColor: Color.fromRGBO(62, 63, 67, 1),
        backgroundColor: Color.fromRGBO(241, 213, 214, 1),
        buttonColor: Color.fromRGBO(160, 123, 63, 1)
      ),
    );
  }
}

