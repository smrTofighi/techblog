import 'package:flutter/material.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';

class MyIcon {
  static ImageProvider play = Image.asset(Assets.icons.play.path).image;
  static ImageProvider back = Image.asset(Assets.icons.playBack.path).image;
  static ImageProvider next = Image.asset(Assets.icons.playNext.path).image;
  static ImageProvider repeat = Image.asset(Assets.icons.repeat.path).image;
}
