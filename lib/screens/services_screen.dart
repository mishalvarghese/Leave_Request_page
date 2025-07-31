import 'package:flutter/material.dart';
import '../../widgets/service_tile.dart';
import 'company_requests_screen.dart';
import 'home_screen.dart';
import 'leave_requests_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/Ellipse 48.png'),
            ),
            const SizedBox(width: 12),
            const Text(
              'Services',
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: [
            // Search bar + Filter button
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Colors.black54, size: 20),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Grid of service tiles
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  const ServiceTile(
                    icon: Icons.emoji_events,
                    label: 'PERFORMANCE',
                    iconColor: Colors.orange,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LeaveRequestsScreen()),
                      );
                    },
                    child: const ServiceTile(
                      icon: Icons.calendar_today,
                      label: 'LEAVE',
                      iconColor: Colors.blue,
                    ),
                  ),
                  const ServiceTile(
                    icon: Icons.star,
                    label: 'ORGANIZATION',
                    iconColor: Colors.amber,
                  ),
                  const ServiceTile(
                    icon: Icons.access_time,
                    label: 'TIMESHEET',
                    iconColor: Colors.green,
                  ),
                  const ServiceTile(
                    icon: Icons.event_available,
                    label: 'ATTENDANCE',
                    iconColor: Colors.red,
                  ),
                  const ServiceTile(
                    icon: Icons.folder,
                    label: 'FILES',
                    iconColor: Colors.teal,
                  ),
                ],
              ),
            )
,
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: const Color.fromRGBO(30, 27, 56, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CompanyReportScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Coming soon')),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services, color: Colors.orange),
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
            icon: Icon(Icons.menu),
            label: "MORE",
          ),
        ],
      )
,

    );
  }
}
