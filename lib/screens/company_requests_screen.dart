import 'package:flutter/material.dart';
import 'package:leave_requests_app/screens/services_screen.dart';

import 'home_screen.dart';

class CompanyReportScreen extends StatelessWidget {
  const CompanyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF5F5F5),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 8),
            const Text(
              'Company Requests',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),

      body: Column(
        children: [

      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            "REPORTS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal,
              fontSize: 16,
            ),
          ),
          Text(
            "DOWNLOADS",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),

           Divider(),
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  title: const Text("Attendance", style: TextStyle(fontWeight: FontWeight.bold)),
                  children: const [
                    ListTile(title: Text("Attendance Summary Report")),
                    ListTile(title: Text("Detailed Attendance Report")),
                    ListTile(title: Text("Late Arrival Report")),
                    ListTile(title: Text("Leave Report")),
                    ListTile(title: Text("Overtime Report")),
                  ],
                ),
                const Divider(),
                _buildSimpleTile("Salary"),
                _buildSimpleTile("Notes"),
                _buildSimpleTile("Employee List"),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        backgroundColor: const Color.fromRGBO(30, 27, 56, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ServicesScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: "SERVICES",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: "APPROVALS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.orange),
            label: "MORE",
          ),
        ],
      )
,
    );
  }
  Widget _buildSimpleTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
