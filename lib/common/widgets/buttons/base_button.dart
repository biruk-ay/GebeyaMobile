import 'package:flutter/material.dart';
import 'package:gebeya/configs/ui_configs.dart';

class BaseButton extends ElevatedButton {
  BaseButton(
      {super.key,
      super.onPressed,
      super.child,
      EdgeInsets? padding,
      Color? textColor,
      BorderSide? borderSide,
      BorderRadius? borderRadius,
      Color? backgroundColor})
      : super(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? ColorsConfigs.primary, //
                padding: padding ?? const EdgeInsets.symmetric(
                    horizontal: SpacingConfigs.spacing2,
                    vertical: SpacingConfigs.spacing3
                ),// setting col
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SpacingConfigs.spacing2),
                    side: borderSide ?? BorderSide.none
                ),

            )
  );
}
