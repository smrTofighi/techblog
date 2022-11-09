// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tech_blog_app/core/styles/text_style.dart';
import 'package:tech_blog_app/core/values/dimens.dart';

import '../../core/values/colors.dart';
import '../../gen/assets.gen.dart';

class TitleWithIconBlue extends StatelessWidget {
  const TitleWithIconBlue({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          right: Dimens.bodyMargin / 2,
          bottom: 8,
        ),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(Assets.icons.bluepen.path),
              color: SolidColors.seeMore,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              title,
              style: MyTextStyle.blueText,
            ),
          ],
        ),
      ),
    );
  }
}
