import 'package:flutter/material.dart';

class Konstant {
  // static var screenData =
  //     WidgetsBinding.instance.platformDispatcher.implicitView;
  static var textTheme = ThemeData(fontFamily: "Pangolin").textTheme;
  static const insets5 = EdgeInsets.all(5);
  static const insets10 = EdgeInsets.all(10);
  static var bodyTextWhite =
      textTheme.bodyMedium!.copyWith(color: Colors.white);
  static var titleTextTheme = textTheme.titleLarge!;
}
