import 'package:flutter/material.dart';
import '../models/leave_request_model.dart';
import 'package:intl/intl.dart';

class LeaveCard extends StatelessWidget {
  final LeaveRequest request;

  const LeaveCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    String formatDate(dynamic date) {
      if (date is String) {
        try {
          date = DateTime.parse(date); // Assumes format 'YYYY-MM-DD'
        } catch (e) {
          return date.toString(); // fallback
        }
      }
      return DateFormat('dd MMM yyyy').format(date);
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top padding
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage:
                      AssetImage("assets/images/${request.imageUrl}"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        request.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Applied on\n${formatDate(request.appliedDate)}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: request.type == "Sick Leave"
                        ? Colors.green[100]
                        : Colors.blue[100],
                  ),
                  child: Text(request.type,
                      style: const TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 12),

                _buildInfoRow("Leave Date:",
                    "${formatDate(request.fromDate)} - ${formatDate(request.toDate)}"),
                _buildInfoRow("Duration:", "1 day(s)"),
                if (request.type != "Unpaid Leave")
                  _buildInfoRow("Leave Balance:", "${request.balance} day(s)"),
                _buildInfoRow("Reason:", request.reason),
              ],
            ),
          ),

          // Buttons at bottom
          Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromRGBO(209, 239, 234, 1.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("APPROVE",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromRGBO(255, 229, 229, 1.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("REJECT",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("EDIT",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 100,
              child: Text(label,
                  style: const TextStyle(color: Colors.grey, fontSize: 13))),
          Expanded(
              child: Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13))),
        ],
      ),
    );
  }
}
