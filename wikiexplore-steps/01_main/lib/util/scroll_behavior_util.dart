// This is not going to be included in the tutorial.
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomScrollBehavior extends CupertinoScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
