// @dart=2.9

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furns_grid/screens/SignUp.dart';
import 'package:furns_grid/screens/addAdress.dart';
import 'package:furns_grid/screens/login.dart';
import 'package:furns_grid/screens/product.dart';
import 'package:furns_grid/services/auth_services.dart';
import 'screens/Home.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationServices>(
          create: (_) => AuthenticationServices(FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: 0,
          create: (context) =>
              context.read<AuthenticationServices>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(accentColor: Color(0xFFFF1E00)),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => AuthenticationCheck(),
          '/ProductPage': (context) => ProductPage(),
          '/Profile/addAddress': (context) => AddAddress(),
          '/Login/Signup': (context) => SignUp(),
        },
      ),
    );
  }
}

class AuthenticationCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else
            return LoginPage();
        });
  }
}
