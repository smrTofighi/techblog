import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tech_blog_app/controllers/podcasts/podcast_single_controller.dart';
import 'package:tech_blog_app/core/styles/text_style.dart';
import 'package:tech_blog_app/core/values/decorations.dart';
import 'package:tech_blog_app/core/values/dimens.dart';
import 'package:tech_blog_app/core/values/icons.dart';
import 'package:tech_blog_app/models/podcats_model.dart';

import '../../../core/values/colors.dart';
import '../../../gen/assets.gen.dart';

// ignore: must_be_immutable
class PodcatsSinglePage extends StatelessWidget {
  late PodcastSingleController podcastSingleController;
  late PodcastModel podcastModel;
  PodcatsSinglePage({Key? key}) : super(key: key) {
    podcastModel = Get.arguments;
    podcastSingleController =
        Get.put(PodcastSingleController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(podcastSingleController.id);
    debugPrint(podcastSingleController.podcastFileList.toString());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: Dimens.width,
                    height: Dimens.height / 2.7,
                    child: CachedNetworkImage(
                      imageUrl: podcastModel.poster!,
                      imageBuilder: (context, imageProvider) => Image(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                      placeholder: (context, url) => const Center(
                        child: SpinKitDoubleBounce(
                          color: SolidColors.primery,
                          size: 32,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Image.asset(Assets.images.posterTest.path),
                    ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    podcastModel.title!,
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
                    Text(
                      podcastModel.publisher!,
                      style: MyTextStyle.podcatsPart,
                    )
                  ],
                ),
              ),
              Obx(
                () => ListView.builder(
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
                        SizedBox(
                          width: Dimens.width / 1.3,
                          child: Text(
                              podcastSingleController
                                  .podcastFileList[index].title!,
                              style: MyTextStyle.podcatsPart),
                        ),
                        const Spacer(),
                        Text(
                          podcastSingleController.podcastFileList[index].lenght
                                  .toString() +
                              ':00',
                          style: MyTextStyle.podcastTime,
                        )
                      ],
                    ),
                  ),
                  itemCount: podcastSingleController.podcastFileList.length,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            width: Dimens.width,
            height: Dimens.height / 8,
            decoration: MyDecoration.mainGradiant,
            margin: EdgeInsets.fromLTRB(
                Dimens.bodyMargin, 0, Dimens.bodyMargin, 12),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LinearPercentIndicator(
                  percent: 0.75,
                  backgroundColor: Colors.white,
                  progressColor: Colors.orange,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImageIcon(
                      MyIcon.next,
                      color: Colors.white,
                      size: 14,
                    ),
                    ImageIcon(
                      MyIcon.play,
                      color: Colors.white,
                      size: 36,
                    ),
                    ImageIcon(
                      MyIcon.back,
                      color: Colors.white,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 32.0,
                    ),
                    ImageIcon(
                      MyIcon.repeat,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
