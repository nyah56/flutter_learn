class UserModel {
  String? email;
  String? username;

  UserModel(this.email, this.username);

  UserModel.fromJson(Map<String, dynamic> map) {
    email = map['email'];
    username = map['username'];
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'username': username};
  }
}
