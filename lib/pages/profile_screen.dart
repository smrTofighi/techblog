import 'package:flutter/material.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/constant/strings.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';

import '../constant/component.dart';

class ProflieScreen extends StatelessWidget {
  const ProflieScreen(
      {Key? key,
      required this.size,
      required this.bodyMargin,
      required this.textTheme})
      : super(key: key);
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(Assets.images.avatar.path),
            height: 100,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(Assets.icons.bluepen.path),
                color: SolidColors.seeMore,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                ValueStrings.imageProfileEdit,
                style: textTheme.headline3,
              ),
            ],
          ),
          const SizedBox(
            height: 60.0,
          ),
          Text(
            'سیدمحمد رضاتوفیقی',
            style: textTheme.headline4,
          ),
          Text(
            'mrtofxn@gmail.com',
            style: textTheme.headline4,
          ),
          const SizedBox(
            height: 40.0,
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              //! One thing run
            },
            splashColor: SolidColors.primery,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  ValueStrings.myFavoriteText,
                  style: textTheme.headline4,
                ),
              ),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              //! One thing run
            },
            splashColor: SolidColors.primery,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  ValueStrings.myFavoritePadCats,
                  style: textTheme.headline4,
                ),
              ),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              //! One thing run
            },
            splashColor: SolidColors.primery,
            child: SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  ValueStrings.logOut,
                  style: textTheme.headline4,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          )
        ],
      ),
    );
  }
}
