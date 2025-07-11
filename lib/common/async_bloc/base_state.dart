
import 'package:gebeya/common/async_bloc/async_status.dart';

import 'async_error.dart';

class BaseState {
  AsyncStatus initStatus = AsyncStatus.none;
  AsyncError? initError;

  BaseState newInstance() {
    return BaseState();
  }

  void copyProperties(BaseState newState) {
    newState.initError = initError;
    newState.initStatus = initStatus;
  }

  BaseState copy() {
    BaseState newState = newInstance();
    copyProperties(newState);
    return newState;
  }
}
