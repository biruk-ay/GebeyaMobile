import 'package:flutter/widgets.dart';
import 'package:gebeya/configs/ui_configs.dart';
import 'package:gebeya/common/async_bloc/base_state.dart';
import 'package:gebeya/common/utils/routing.dart';
import 'package:gebeya/common/widgets/buttons/base_button.dart';
import 'package:gebeya/common/widgets/containers/full_container.dart';
import 'package:gebeya/common/widgets/containers/percentage_container.dart';
import 'package:gebeya/common/widgets/text/body.dart';
import 'package:gebeya/common/widgets/text/headers.dart';

class ErrorScreen extends StatelessWidget {
  final BaseState state;

  const ErrorScreen(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return FullContainer(
      decoration: BoxDecoration(color: ColorsConfigs.white),
      child: PercentageContainer(
        width: 0.75,
        child: Column(
          children: [
            Image.asset("assets/images/error.png"),
            const SizedBox(height: SpacingConfigs.spacing5),
            Heading2(
              "Sorry, An Error has Occurred",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SpacingConfigs.spacing3),
            BodyText(
              state.initError?.message ?? "Something went wrong",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SpacingConfigs.spacing2),
            BaseButton(
              onPressed: () {
                RoutingUtils.redirect("/", context);
              },
              child: BodyText("Go to Home", color: ColorsConfigs.white),
            ),
          ],
        ),
      ),
    );
  }
}
