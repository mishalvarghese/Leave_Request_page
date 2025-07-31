import 'package:flutter/material.dart';
import 'package:leave_requests_app/screens/services_screen.dart';

import 'company_requests_screen.dart';
import 'leave_requests_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/Ellipse 48.png'),
            ),
             SizedBox(width: 12),
             Text(
              'Home',
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
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [
          Container(
          height: 130,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Text content
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Update!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'is simply dummy text of the printing & '''
                              'typesetting industry..',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              Positioned(
                right: -50,
                top: -20,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/images/img3.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
             SizedBox(height: 16),
            Container(
              height: 350,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/img4.png',
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF56C8A6),
                        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Check In',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildHorizontalItem(
                'assets/images/img5.png',
                'Leave Request',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LeaveRequestsScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildHorizontalItem(
                'assets/images/img6.png',
                'Attendance',
                    () {
                },
              ),
              const SizedBox(height: 16),
              _buildHorizontalItem(
                'assets/images/img5.png',
                'Salary',
                    () {
                  // future navigation
                },
              ),
            ],
          ),
        ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // 'HOME' is selected
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
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CompanyReportScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: "SERVICES",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orange),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: "APPROVALS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "MORE",
          ),
        ],
      )
,
    );
  }


  Widget _buildHorizontalItem(String imgPath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imgPath),
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
