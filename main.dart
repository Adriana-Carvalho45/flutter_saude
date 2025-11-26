import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'consultas_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => LoginScreen(),
      "/welcome": (context) => WelcomeScreen(),
      "/consultas": (context) => ConsultasScreen(),
    },
  ));
}
