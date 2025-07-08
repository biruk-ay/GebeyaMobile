
import 'package:flutter/widgets.dart';

class RoutingUtils {
  static void redirect(String path, BuildContext context, {Object? arguments}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushReplacementNamed(context, path, arguments: arguments);
    });
    WidgetsBinding.instance.scheduleFrame();
  }
}