import 'package:gebeya/apps/auth/data/models/user.dart';
import 'package:gebeya/apps/auth/data/serializers/user_serializer.dart';
import 'package:gebeya/common/network/request.dart';

class SignupRequest extends Request<User> {
  final _serializer = UserSerializer();

  SignupRequest(String name, String email, String password)
    : super(
        "/user/register",
        method: Method.post,
        postParams: {"name": name, "email": email, "password": password},
      );
  @override
  User deserializeObject(response) {
    return _serializer.deserialize(response);
  }
}
