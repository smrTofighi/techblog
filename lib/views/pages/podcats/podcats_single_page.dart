import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tech_blog_app/core/styles/text_style.dart';
import 'package:tech_blog_app/core/values/decorations.dart';
import 'package:tech_blog_app/core/values/dimens.dart';

import '../../../core/values/colors.dart';
import '../../../gen/assets.gen.dart';

class PodcatsSinglePage extends StatelessWidget {
  const PodcatsSinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: 'articleSingleController',
                    imageBuilder: (context, imageProvider) =>
                        Image(image: imageProvider),
                    placeholder: (context, url) => const Center(
                      child: SpinKitDoubleBounce(
                        color: SolidColors.primery,
                        size: 32,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(Assets.images.posterTest.path),
                  ),
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
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'محمدتوفیقی',
                    style: MyTextStyle.bigTitle,
                    maxLines: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                      image: Image.asset(Assets.images.avatar.path).image,
                      height: 40,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'ساسان صفری',
                      style: MyTextStyle.podcatsPart,
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageIcon(
                        Image.asset(Assets.icons.bluepad.path).image,
                        color: SolidColors.seeMore,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text('بخش اول: دوستت دارم',
                          style: MyTextStyle.podcatsPart),
                      const Spacer(),
                      const Text(
                        '20:40',
                        style: MyTextStyle.podcastTime,
                      )
                    ],
                  ),
                ),
                itemCount: 4,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: Dimens.width,
          height: Dimens.height / 8,
          decoration: MyDecoration.mainGradiant,
          margin:
              EdgeInsets.fromLTRB(Dimens.bodyMargin, 0, Dimens.bodyMargin, 12),
          child: LinearPercentIndicator(
            percent: 1.0,
            backgroundColor: Colors.white,
            
          ),
        ),
      ),
    );
  }
}
