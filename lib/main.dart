import 'package:chstore/ui/authentication/loginPage.dart';
import 'package:chstore/ui/authentication/register/register_addressPage.dart';
import 'package:chstore/ui/authentication/register/register_emailPage.dart';
import 'package:chstore/ui/authentication/register/register_numberPhonePage.dart';
import 'package:chstore/ui/authentication/welcomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/WelcomePage': (context) => WelcomePage(),
        '/LoginPage': (context) => LoginPage(),
        '/Register_EmailPage': (context) => Register_EmailPage(),
        '/Register_NumberPhonePage': (context) => Register_NumberPhonePage(),
        '/Register_AddressPage': (context) => Register_AddressPage(),
      },
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 67, 129, 145)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
