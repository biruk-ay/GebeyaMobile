
import 'package:gebeya/apps/auth/application/events/signup_event.dart';
import 'package:gebeya/apps/auth/application/states/signup_state.dart';
import 'package:gebeya/apps/auth/data/repositories/user_repository.dart';
import 'package:gebeya/common/async_bloc/async_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends AsyncBloc<SignupState> {
  final userRepository = UserRepository();
  SignupBloc(super.initialState) {
    on<SignupEvent>(_handleSignup);
  }

  _handleSignup(
    SignupEvent event,
    Emitter emitter,
  ) async {
    await asyncCall(
      event,
      emitter,
      (_, __) async {
        await state.signupForm.isValid(throwError: true);
        await userRepository.signup(
          state.signupForm.name.getValue()!,
          state.signupForm.email.getValue()!,
          state.signupForm.password.getValue()!,
        );
      },
    );
  }
}
