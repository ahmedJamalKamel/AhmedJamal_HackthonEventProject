class EventComment {
  late int id;
  late String comment;
  late int eventId;
  late int userId;
  late String createdAt;

  EventComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    eventId = json['event_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
  }
}
