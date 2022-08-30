import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/constant/text_style.dart';
import 'package:tech_blog_app/controllers/home_view_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../gen/assets.gen.dart';
import 'colors.dart';


myLaunchUrl(String url) async{
  var uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  }
  else{
    await launchUrl(uri);
  }
}


 PreferredSize appBar(String title) {
    return PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: const [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Center(
                  child: Text(
                'مقالات جدید',
                style: TextStyles.appBarTextStyle,
              )),
            )
                ],
                leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: SolidColors.primery.withBlue(100), shape: BoxShape.circle),
                  child: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
                ),
              ),
          ),
        );
  }

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.divider,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({Key? key, required this.textTheme, required this.index, required this.listItem, }) : super(key: key);
  final TextTheme textTheme;
  final int index;
  final RxList listItem;
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                gradient: LinearGradient(
                  colors: GradiantColors.hashTag,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.hashtagicon.path),
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      Get.find<HomeViewController>().tagsList[index].title!,
                      style: textTheme.headline2,
                    ),
                  ],
                ),
              ),
            );
  }
}