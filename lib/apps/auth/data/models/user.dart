class UserModel {
  String name;
  String email;
  String token;
  String id;

  UserModel({
    required this.name,
    required this.email,
    required this.token,
    required this.id,
  });
}

class User {
  bool success;
  UserModel userModel;

  User({required this.success, required this.userModel});
}
