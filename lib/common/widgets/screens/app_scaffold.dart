import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gebeya/configs/ui_configs.dart';
import 'package:google_fonts/google_fonts.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  const AppScreen({
    required this.child,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    super.key
  }):
        systemUiOverlayStyle = systemUiOverlayStyle ?? SystemUiOverlaysConfigs.overlayLight
  ;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        return;
      },
      child: DefaultTextStyle(
        style: GoogleFonts.roboto(),
        child: Scaffold(
          backgroundColor: ColorsConfigs.white,
          appBar: AppBar(
              toolbarHeight: 0,
              elevation: 0,
              systemOverlayStyle: systemUiOverlayStyle
          ),
          body: SafeArea(
            child: child,
          ),
        ),
      ),
    );
  }
}
