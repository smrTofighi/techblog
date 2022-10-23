import 'package:flutter/material.dart';

import '../values/colors.dart';

class MyTextStyle {
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
}
