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
import 'package:tech_blog_app/views/widgets/loading.dart';

import '../../../core/values/colors.dart';
import '../../../gen/assets.gen.dart';

// ignore: must_be_immutable
class PodcatsSinglePage extends StatelessWidget {
  late PodcastSingleController podcastController;
  late PodcastModel podcastModel;
  PodcatsSinglePage({Key? key}) : super(key: key) {
    podcastModel = Get.arguments;
    podcastController = Get.put(PodcastSingleController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(podcastController.id);
    debugPrint(podcastController.podcastFileList.toString());
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
                    child: GestureDetector(
                      onTap: () async {
                        await podcastController.player
                            .seek(Duration.zero, index: index);
                        podcastController.currentIndex.value =
                            podcastController.player.currentIndex!;
                      },
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
                            child: Obx(
                              () => Text(
                                  podcastController
                                      .podcastFileList[index].title!,
                                  style: podcastController.currentIndex.value ==
                                          index
                                      ? MyTextStyle.podcatsPartOn
                                      : MyTextStyle.podcatsPart),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            podcastController.podcastFileList[index].lenght
                                    .toString() +
                                ':00',
                            style: MyTextStyle.podcastTime,
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: podcastController.podcastFileList.length,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavigation(podcastController: podcastController),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.podcastController,
  }) : super(key: key);

  final PodcastSingleController podcastController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.width,
      height: Dimens.height / 8,
      decoration: MyDecoration.mainGradiant,
      margin: EdgeInsets.fromLTRB(Dimens.bodyMargin, 0, Dimens.bodyMargin, 12),
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
              IconButton(
                onPressed: () async {
                  await podcastController.player.seekToNext();
                  podcastController.currentIndex.value =
                      podcastController.player.currentIndex!;
                },
                icon: ImageIcon(
                  MyIcon.next,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              IconButton(
                onPressed: () {
                  podcastController.playState.value
                      ? podcastController.player.stop()
                      : podcastController.player.play();
                  podcastController.playState.value =
                      podcastController.player.playing;
                  podcastController.currentIndex.value =
                      podcastController.player.currentIndex!;
                },
                icon: Obx(
                  () => Icon(podcastController.playState.value
                      ? Icons.pause_circle_filled_rounded
                      : Icons.play_circle_filled_rounded),
                ),
              ),
              IconButton(
                onPressed: () async {
                  await podcastController.player.seekToPrevious();
                  podcastController.currentIndex.value =
                      podcastController.player.currentIndex!;
                },
                icon: ImageIcon(
                  MyIcon.back,
                  color: Colors.white,
                  size: 14,
                ),
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
      ),
    );
  }
}
