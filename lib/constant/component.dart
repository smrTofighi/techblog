import 'package:flutter/material.dart';
import 'package:tech_blog_app/models/data_model_hashtag.dart';
import 'package:url_launcher/url_launcher.dart';
import '../gen/assets.gen.dart';
import 'colors.dart';
import '../gen/assets.gen.dart';

launchUrl(String url) async{
  var uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(url);
  }
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
  final List<HashTagModel> listItem;
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
                      listItem[index].title.toString(),
                      style: textTheme.headline2,
                    ),
                  ],
                ),
              ),
            );
  }
}