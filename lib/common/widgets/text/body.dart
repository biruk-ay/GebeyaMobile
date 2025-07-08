import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:gebeya/configs/ui_configs.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyText extends Text {
  BodyText(text,
      {super.key,
      double? fontSize,
      Color? color,
      FontWeight? fontWeight = FontWeight.normal,
      double? letterSpacing,
      double? height,
      String? fontFamily,
      super.maxLines,
      super.overflow,
      TextDecoration decoration = TextDecoration.none,
      super.textAlign})
      : super(text,
            style: GoogleFonts.jost(
                height: height,
                letterSpacing: letterSpacing,
                color: color ?? ColorsConfigs.dark,
                fontSize: fontSize ?? FontSizeConfigs.size1,
                decoration: decoration,
                fontWeight: fontWeight
            )
  );
}
