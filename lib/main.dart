import 'package:flutter/material.dart';
import 'package:leave_requests_app/screens/company_requests_screen.dart';
import 'package:leave_requests_app/screens/home_screen.dart';
import 'package:leave_requests_app/screens/services_screen.dart';
import 'screens/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HRMS UI Demo',
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
