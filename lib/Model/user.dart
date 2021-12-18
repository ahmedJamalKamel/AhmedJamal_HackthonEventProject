class User {
  late int id;
  late String name;
  late String mobile;
  late String gender;
  late String token;
  late String tokenType;
  late String refreshToken;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    gender = json['gender'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
  }
}
