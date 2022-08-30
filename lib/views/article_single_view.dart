import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';

class ArticleSingleView extends StatelessWidget {
  const ArticleSingleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: 'imageUrl',
                    imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider),
                          ),
                        ),
                    placeholder: (context, url) => const Center(
                          child: SpinKitDoubleBounce(
                            color: SolidColors.primery,
                            size: 32,
                          ),
                        ),
                    errorWidget: (context, url, error) =>
                        Image.asset(Assets.images.posterTest.path)),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradiantColors.singleAppBarGradiant,
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
