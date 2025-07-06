import 'package:gebeya/apps/auth/data/models/user.dart';
import 'package:gebeya/apps/auth/data/requests/login_request.dart';
import 'package:gebeya/apps/auth/data/requests/signup_request.dart';
import 'package:gebeya/di/provider.dart';

class UserRepository {
  Future<User> login(String email, String password) async {
    return await Provider.networkClient().execute(
      LoginRequest(email, password),
    );
  }

  Future<User> signup(String name, String email, String password) async {
    return await Provider.networkClient().execute(
      SignupRequest(name, email, password),
    );
  }
}
