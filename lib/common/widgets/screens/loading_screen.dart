import 'package:flutter/widgets.dart';
import 'package:gebeya/common/widgets/screens/app_scaffold.dart';
import 'package:gebeya/common/widgets/text/headers.dart';
import 'package:gebeya/configs/ui_configs.dart';
import 'package:gebeya/common/widgets/containers/full_container.dart';
import 'package:gebeya/common/widgets/containers/percentage_container.dart';


class LoadingScreen extends StatelessWidget {

  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: FullContainer(
          decoration: const BoxDecoration(
              color: ColorsConfigs.white
          ),
          child: PercentageContainer(
              width: 0.75,
              child: Column(
                children: [
                  Image.asset("assets/images/logo.png"),
                  const SizedBox(
                      height: WidgetSizeConfigs.size0,
                  ),
                  const SizedBox(
                      width: WidgetSizeConfigs.size0,
                      child: LoadingIndicatorsConfigs.indicatorDark
                  ),
                  const SizedBox(
                      height: WidgetSizeConfigs.size0,
                  ),
                  Heading3("LOADING...")
                ],
              ))),
    );
  }
}
