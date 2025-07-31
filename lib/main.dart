import 'package:flutter/material.dart';
import 'screens/leave_requests_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leave Requests',
      debugShowCheckedModeBanner: false,
      home: const LeaveRequestsScreen(),
    );
  }
}
