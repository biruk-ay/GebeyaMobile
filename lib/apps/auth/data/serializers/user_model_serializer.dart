import 'package:gebeya/apps/auth/data/models/user.dart';
import 'package:gebeya/common/serializers/serializer.dart';

class UserModelSerializer extends Serializer<UserModel, Map<String, dynamic>> {
  @override
  UserModel deserialize(Map<String, dynamic> data) {
    return UserModel(
      name: data["name"],
      email: data["email"],
      token: data["token"],
      id: data["id"],
    );
  }

  @override
  Map<String, dynamic> serialize(UserModel instance) {
    return {
      "name": instance.name,
      "email": instance.email,
      "token": instance.token,
      "id": instance.id,
    };
  }
}
