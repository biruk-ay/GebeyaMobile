
import 'package:gebeya/apps/auth/application/forms/signup_form.dart';
import 'package:gebeya/common/async_bloc/async_state.dart';
import 'package:gebeya/common/async_bloc/base_state.dart';

class SignupState extends AsyncState {
  SignupForm signupForm = SignupForm();

  @override
  BaseState newInstance() {
    return SignupState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as SignupState).signupForm = signupForm;
  }
}
