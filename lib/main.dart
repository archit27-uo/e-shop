import 'package:e_commerce/pages/LoginPage.dart';
import 'package:e_commerce/pages/ProductPage.dart';
import 'package:e_commerce/pages/SignUpPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/signup': (context) => SignUpPage(),
      '/product': (context) => ProductPage(),
    },
  ));
}

