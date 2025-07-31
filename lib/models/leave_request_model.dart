class LeaveRequest {
  final String name;
  final String type;
  final String reason;
  final String imageUrl;
  final DateTime fromDate;
  final DateTime toDate;
  final int balance;
  final String appliedDate;

  LeaveRequest({
    required this.name,
    required this.type,
    required this.reason,
    required this.imageUrl,
    required this.fromDate,
    required this.toDate,
    required this.balance,
    required this.appliedDate,
  });
}
