import 'package:gebeya/apps/auth/data/models/user.dart';
import 'package:gebeya/apps/auth/data/serializers/user_serializer.dart';
import 'package:gebeya/common/network/request.dart';

class LoginRequest extends Request<User> {
  final _serializer = UserSerializer();

  LoginRequest(String email, String password)
    : super(
        "/user/login",
        method: Method.post,
        postParams: {"email": email, "password": password},
      );
  @override
  User deserializeObject(response) {
    return _serializer.deserialize(response);
  }
}
