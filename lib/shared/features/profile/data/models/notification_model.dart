class NotificationModel {
  final String notificationID;
  final String notificationTitle;
  final String notificationMessage;
  final String notificationTime;

  NotificationModel({
    required this.notificationID,
    required this.notificationTitle,
    required this.notificationMessage,
    required this.notificationTime,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationID: json['_id'],
      notificationTitle: json['title'],
      notificationMessage: json['message'] ?? '',
      notificationTime: json['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': notificationID,
      'title': notificationTitle,
      'message': notificationMessage,
      'createdAt': notificationTime,
    };
  }
}
