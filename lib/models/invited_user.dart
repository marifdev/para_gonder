class InvitedUser {
  String firstName = '';
  String lastName = '';
  int totalEarned = 0;
  int? maximumEarnAmount = 0;
  bool isEarned = false;
  DateTime date = DateTime.now();

  InvitedUser({
    required this.firstName,
    required this.lastName,
    required this.totalEarned,
    required this.maximumEarnAmount,
    required this.isEarned,
    required this.date,
  });

  InvitedUser.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    totalEarned = json['totalEarned'];
    maximumEarnAmount = json['maximumEarnAmount'];
    isEarned = json['isEarned'];
    date = DateTime.fromMillisecondsSinceEpoch(json['date']);
  }
}
