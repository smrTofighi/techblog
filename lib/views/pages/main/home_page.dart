import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/views/widgets/component.dart';
import 'package:tech_blog_app/controllers/home/home_view_controller.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/models/fake_data.dart';
import '../../../controllers/articles/article_list_controller.dart';
import '../../../controllers/articles/article_single_controller.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import '../../../core/values/strings.dart';
import '../articles/article_list_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.textTheme}) : super(key: key);
  final TextTheme textTheme;
  HomeViewController homeViewController = Get.put(HomeViewController());
  ArticleSingleController articleSingleController =
      Get.put(ArticleSingleController());
  ArticleListController articleListController =
      Get.put(ArticleListController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: homeViewController.loading.value == false
                  ? Column(
                      children: [
                        //? -------------------------
                        const MySizedBox(height: 8),

                        //? poster ------------------
                        poster(),

                        //? -------------------------
                        const MySizedBox(height: 16),

                        //? hashtag ----------------
                        tags(),
                        //?-------------------------
                        const MySizedBox(height: 32),

                        //? see more ---------------
                        seeMoreArticle(),

                        //? blog posts -------------

                        topVisited(),
                        //? ------------------------
                        const MySizedBox(height: 32),

                        //? padcats ----------------
                        SeeMorePadcast(
                            bodyMargin: Dimens.bodyMargin,
                            textTheme: textTheme),

                        //? padcats posts ----------
                        topPadcasts(),

                        const MySizedBox(height: 60),
                      ],
                    )
                  : SizedBox(
                      height: Get.height,
                      child: const Center(
                        child: SpinKitDoubleBounce(
                          color: SolidColors.primery,
                          size: 32,
                        ),
                      ),
                    )),
        ));
  }

  Widget seeMoreArticle() {
    return InkWell(
      onTap: () {
        Get.to(ArticleListPage(titleAppBar: 'مقالات جدید'));
      },
      child: Padding(
        padding: EdgeInsets.only(
          right: Dimens.bodyMargin,
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
              ValueStrings.viewHotesBlog,
              style: textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: Get.height / 3.5,
      child: Obx(
        (() => ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    articleSingleController.getArticleInfo(
                        homeViewController.topVisitedList[index].id);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: index == 0 ? Dimens.bodyMargin : 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: Get.height / 5.3,
                            width: Get.width / 2.4,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: homeViewController
                                      .topVisitedList[index].image!,
                                  imageBuilder: ((context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        foregroundDecoration:
                                            const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          gradient: LinearGradient(
                                            colors: GradiantColors.blogPost,
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                      )),
                                  placeholder: (context, url) =>
                                      const SpinKitFoldingCube(
                                    color: SolidColors.primery,
                                    size: 32.0,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 50.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        homeViewController
                                            .topVisitedList[index].author!,
                                        style: textTheme.subtitle1,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            homeViewController
                                                .topVisitedList[index].view!,
                                            style: textTheme.subtitle1,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: Colors.white,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 2.4,
                          child: Text(
                            homeViewController.topVisitedList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },

              //? --------------------
              itemCount: homeViewController.topVisitedList.length,
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }

  Widget topPadcasts() {
    return SizedBox(
      height: Get.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(right: index == 0 ? Dimens.bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: Get.height / 5.3,
                      width: Get.width / 2.4,
                      child: CachedNetworkImage(
                        imageUrl: homeViewController.topPadcasts[index].poster!,
                        //? ----------------------

                        imageBuilder: ((context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),

                        //? ---------------------

                        placeholder: (context, url) => const SpinKitFoldingCube(
                          color: SolidColors.primery,
                          size: 32.0,
                        ),
                        //? ---------------------

                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2.4,
                    child: Align(
                      child: Text(
                        homeViewController.topPadcasts[index].title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            );
          },

          //? --------------------
          itemCount: homeViewController.topPadcasts.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: Get.width / 1.19,
          height: Get.height / 4.2,
          child: CachedNetworkImage(
            imageUrl: homeViewController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const SpinKitFadingCube(
              color: SolidColors.primery,
              size: 32.0,
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.image_not_supported_rounded),
            ),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
            gradient: LinearGradient(
                colors: GradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homaPagePosterMap["writer"] +
                        " - " +
                        homaPagePosterMap["date"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homaPagePosterMap["view"],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                homeViewController.poster.value.title!,
                style: textTheme.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              await articleListController.getArticleListWithTagsId(
                  homeViewController.tagsList[index].id!);
              var titleAppBar = homeViewController.tagsList[index].title!;
              Get.to(ArticleListPage(
                titleAppBar: titleAppBar,
              ));
            },
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 8, index == 0 ? Dimens.bodyMargin : 15, 8),
                child: MainTags(
                  textTheme: textTheme,
                  index: index,
                  listItem: homeViewController.tagsList,
                )),
          );
        },
        itemCount: homeViewController.tagsList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class MySizedBox extends StatelessWidget {
  const MySizedBox({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SeeMorePadcast extends StatelessWidget {
  const SeeMorePadcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: bodyMargin,
        bottom: 8,
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.bluepad.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            ValueStrings.viewHotesPadCast,
            style: textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
