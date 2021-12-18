class EventImage {
  late int id;
  late int objectId;
  late String url;
  late String name;
  late String createdAt;
  late String imageUrl;
  
  EventImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectId = json['object_id'];
    url = json['url'];
    name = json['name'];
    createdAt = json['created_at'];
    imageUrl = json['image_url'];
  }
}
