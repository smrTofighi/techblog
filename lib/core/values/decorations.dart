import 'package:flutter/material.dart';
import 'package:tech_blog_app/core/values/colors.dart';

class MyDecoration {
  MyDecoration._();

  static BoxDecoration mainGradiant = BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      gradient: const LinearGradient(colors: GradiantColors.bottomNav));
}
