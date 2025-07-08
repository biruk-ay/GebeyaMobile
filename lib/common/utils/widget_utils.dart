


import 'package:flutter/widgets.dart';

class WidgetUtils{

  static onInit(void Function() callback){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callback();
    });
    WidgetsBinding.instance.scheduleFrame();
  }

}