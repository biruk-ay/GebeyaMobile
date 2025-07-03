import 'package:gebeya/apps/auth/data/models/user.dart';
import 'package:gebeya/apps/auth/data/serializers/user_model_serializer.dart';
import 'package:gebeya/common/serializers/serializer.dart';

class UserSerializer extends Serializer<User, Map<String, dynamic>> {

  final serializer = UserModelSerializer();

  @override
  User deserialize(Map<String, dynamic> data) {
    return User(
      success: data["success"],
      userModel: serializer.deserialize(data["user"]));
  }

  @override
  Map<String, dynamic> serialize(User instance) {
    return {"name": instance.userModel.name, "email": instance.userModel.email};
  }
}
