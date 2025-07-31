import 'package:flutter/material.dart';
import '../models/leave_request_model.dart';
import '../widgets/leave_card.dart';

class LeaveRequestsScreen extends StatelessWidget {
  const LeaveRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<LeaveRequest> requests = [
      LeaveRequest(
        name: "Abhay Kumar",
        type: "Sick Leave",
        reason: "High fever",
        imageUrl: "Ellipse 48.png",
        fromDate: DateTime(2022, 11, 19),
        toDate: DateTime(2022, 11, 19),
        balance: 0,
        appliedDate: "19 Nov 2022",
      ),
      LeaveRequest(
        name: "Neha",
        type: "Unpaid Leave",
        reason: "Going to village due to urgency",
        imageUrl: "img2.png",
        fromDate: DateTime(2022, 11, 19),
        toDate: DateTime(2022, 11, 19),
        balance: 0,
        appliedDate: "19 Nov 2022",
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Leave Requests"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
              },
            ),
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: const Color.fromRGBO(30, 27, 56, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services), label: "SERVICES"),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.orange),
              label: "HOME",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.check), label: "APPROVALS"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "MORE"),
          ],
        ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("PENDING REQUESTS", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("HISTORY", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) => LeaveCard(request: requests[index]),
            ),
          ),
        ],
      ),
    );
  }
}
