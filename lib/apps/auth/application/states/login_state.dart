import 'package:gebeya/apps/auth/application/forms/login_form.dart';
import 'package:gebeya/common/async_bloc/async_state.dart';
import 'package:gebeya/common/async_bloc/base_state.dart';

class LoginState extends AsyncState {
  LoginForm loginForm = LoginForm();

  @override
  BaseState newInstance() {
    return LoginState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as LoginState).loginForm = loginForm;
  }
}
