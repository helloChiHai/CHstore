import 'package:chstore/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:chstore/blocs/ProductBloc/product_bloc.dart';
import 'package:chstore/ui/authentication/forgotPassword/findAccount_email.dart';
import 'package:chstore/ui/authentication/forgotPassword/findAccount_phone.dart';
import 'package:chstore/ui/authentication/loginPage.dart';
import 'package:chstore/ui/authentication/register/register_addressPage.dart';
import 'package:chstore/ui/authentication/register/register_emailPage.dart';
import 'package:chstore/ui/authentication/register/register_namePage.dart';
import 'package:chstore/ui/authentication/register/register_numberPhonePage.dart';
import 'package:chstore/ui/authentication/register/register_password.dart';
import 'package:chstore/ui/authentication/register/welcome_createAccountPage.dart';
import 'package:chstore/ui/authentication/welcomePage.dart';
import 'package:chstore/ui/homePage/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/HomePage': (context) => HomePage(),
          '/WelcomeCreateAccountPage': (context) => WelcomeCreateAccountPage(),
          '/WelcomePage': (context) => WelcomePage(),
          '/LoginPage': (context) => LoginPage(),
          '/Register_EmailPage': (context) => Register_EmailPage(),
          '/Register_NumberPhonePage': (context) => Register_NumberPhonePage(),
          '/Register_AddressPage': (context) => Register_AddressPage(),
          '/Register_NamePage': (context) => Register_NamePage(),
          '/Register_PasswordPage': (context) => Register_PasswordPage(),
          '/FindAccountWithEmailPage': (context) => FindAccountWithEmailPage(),
          '/FindAccountWithNumberPhonePage': (context) =>
              FindAccountWithNumberPhonePage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 67, 129, 145)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
