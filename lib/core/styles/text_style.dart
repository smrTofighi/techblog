import 'package:flutter/material.dart';

import '../values/colors.dart';

class MyTextStyle {
  MyTextStyle._();
  static const TextStyle appBarTitle = TextStyle(
      fontFamily: 'Samim',
      fontSize: 14,
      color: SolidColors.primery,
      fontWeight: FontWeight.w700);

  static TextStyle contentArticleSingePage = TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
  );

  static const TextStyle blueText = TextStyle(
    fontFamily: 'Samim',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: SolidColors.seeMore,
  );

  static const TextStyle bigTitle = TextStyle(
    fontSize: 18,
  );

  //? Padcast Page TextStyle

  static const TextStyle podcatsPart =
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  static const TextStyle podcastTime =
      TextStyle(fontSize: 12, color: Colors.grey);
}
