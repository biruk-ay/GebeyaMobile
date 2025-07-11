import 'package:gebeya/common/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gebeya/common/async_bloc/async_bloc.dart';
import 'package:gebeya/common/async_bloc/async_events.dart';
import 'package:gebeya/common/async_bloc/async_status.dart';
import 'package:gebeya/common/async_bloc/base_state.dart';
import 'package:gebeya/common/widgets/screens/app_scaffold.dart';
import 'package:gebeya/common/widgets/screens/error_screen.dart';
import 'package:gebeya/common/widgets/screens/loading_screen.dart';

abstract class AsyncBlocScreen<B extends AsyncBloc<S>, S extends BaseState>
    extends StatelessWidget {
  const AsyncBlocScreen({super.key});

  S onCreateState();

  B onCreateBloc(S state);

  Widget onCreateMain(BuildContext context, S state);

  Widget onLoading(BuildContext context, S state) {
    return LoadingScreen();
  }

  Widget onError(BuildContext context, S state) {
    return ErrorScreen(state);
  }

  SystemUiOverlayStyle? getSystemUiOverlayStyle(){
    return null;
  }

  onInit(BuildContext context, S state){
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      systemUiOverlayStyle: getSystemUiOverlayStyle(),
      child: BlocProvider<B>(
        create: (context) {
          return onCreateBloc(onCreateState());
        },
        child: BlocBuilder<B, S>(
          builder: (BuildContext context, S state) {
            switch (state.initStatus) {
              case AsyncStatus.none:
                context.read<B>().add(InitializeEvent());
                return onLoading(context, state);

              case AsyncStatus.loading:
                return onLoading(context, state);

              case AsyncStatus.done:
                WidgetUtils.onInit(
                    () {
                      onInit(context, state);
                    }
                );
                return onCreateMain(context, state);

              case AsyncStatus.failed:
                return onError(context, state);
            }
          },
        ),
      ),
    );
  }
}
