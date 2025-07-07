
import 'package:gebeya/apps/auth/application/events/login_event.dart';
import 'package:gebeya/apps/auth/application/states/login_state.dart';
import 'package:gebeya/apps/auth/data/repositories/user_repository.dart';
import 'package:gebeya/common/async_bloc/async_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends AsyncBloc<LoginState> {
  final userRepository = UserRepository();
  LoginBloc(super.initialState) {
    on<LoginEvent>(_handleLogin);
  }

  _handleLogin(
    LoginEvent event,
    Emitter emitter,
  ) async {
    await asyncCall(
      event,
      emitter,
      (_, __) async {
        await state.loginForm.isValid(throwError: true);
        await userRepository.login(
          state.loginForm.email.getValue()!,
          state.loginForm.password.getValue()!,
        );
      },
    );
  }
}
