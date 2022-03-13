import 'package:flutter/material.dart';

class MyTheme{
  var context;
  MyTheme(this.context);


  Color app_color1=Color(0xff5CB441);
  Color app_color2=Color(0xff111749);


  Color get background_color{
    return  Theme.of(context).brightness != Brightness.dark?
      Colors.white:Colors.black;
}
  AssetImage get app_logo{
    return  Theme.of(context).brightness != Brightness.dark?
    AssetImage('assets/images/logo_light.png'):AssetImage('assets/images/logo_dark.png');
  }
  Color get back_color{
    return  Theme.of(context).brightness != Brightness.dark?
    app_color2:Colors.white;
  }

  Color get text_color{
    return  Theme.of(context).brightness != Brightness.dark?
    app_color2:Colors.white;
  }

}