import 'package:connect_care/controller/splash_provider/splash_provider.dart';
import 'package:connect_care/view/user/hod/addhod_page.dart';
import 'package:connect_care/view/user/hod/hod_page.dart';
import 'package:connect_care/view/user/home/homepage.dart';
import 'package:connect_care/view/user/recruiter/addrecruiter_page.dart';
import 'package:connect_care/view/user/recruiter/recruiterPage.dart';
import 'package:connect_care/view/user/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/user/login/signin_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        //  ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const splashScreen(),
      routes: {
        // login
        '/signin': (context) => const SignInPage(),
        // '/signup': (context) => const SignUpPage(),
        // // admin
        '/home': (context) => Home(),
        '/hod': (context) => const HodPage(),
        ' /recruiter': (context) => const Recruiterpage(),
          '/add_hod': (context) => const AddhodPage(),
        '/add_recruiter': (context) => const AddrecruiterPage()
      },
    );
  }
}
