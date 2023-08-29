import 'package:flutter/widgets.dart';

bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;

Size screenSize(BuildContext context) => MediaQuery.of(context).size;
