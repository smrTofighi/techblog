import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/constant/component.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/constant/strings.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/models/fake_data.dart';

import '../controllers/home_view_controller.dart';

class HomeView extends StatelessWidget {
  HomeView(
      {Key? key,
      required this.size,
      required this.bodyMargin,
      required this.textTheme})
      : super(key: key);
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;
  HomeViewController homeViewController = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            //? -------------------------
            const MySizedBox(height: 8),

            //? poster ------------------
            HomeViewPoster(size: size, textTheme: textTheme),

            //? -------------------------
            const MySizedBox(height: 16),

            //? hashtag ----------------
            HomeViewTagList(bodyMargin: bodyMargin, textTheme: textTheme),

            //?-------------------------
            const MySizedBox(height: 32),

            //? see more ---------------
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),

            //? blog posts -------------

            topVisited(),
            //? ------------------------
            const MySizedBox(height: 32),

            //? padcats ----------------
            SeeMorePadcast(bodyMargin: bodyMargin, textTheme: textTheme),

            //? padcats posts ----------
            topPadcasts(),

            const MySizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        (() => ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: homeViewController
                                    .topVisitedList[index].image!,
                                //? ----------------------

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
                                      foregroundDecoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: GradiantColors.blogPost,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                    )
                                    ),

                                //? ---------------------

                                placeholder: (context, url) =>
                                    const SpinKitFoldingCube(
                                  color: SolidColors.primery,
                                  size: 32.0,
                                ),
                                //? ---------------------

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
                        width: size.width / 2.4,
                        child: Text(
                          homeViewController.topVisitedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
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
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
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
                    width: size.width / 2.4,
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

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
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
    );
  }
}

class HomeViewPoster extends StatelessWidget {
  const HomeViewPoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            image: DecorationImage(
                image: Image(
                  image: AssetImage(homaPagePosterMap["imageAsset"]),
                ).image,
                fit: BoxFit.cover),
          ),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              gradient: LinearGradient(
                  colors: GradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
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
                'دوازده قدم برنامه نویسی یک دوره ...',
                style: textTheme.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeViewTagList extends StatelessWidget {
  const HomeViewTagList(
      {Key? key, required this.textTheme, required this.bodyMargin})
      : super(key: key);

  final TextTheme textTheme;
  final double bodyMargin;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
                listItem: tagList,
              ));
        },
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
