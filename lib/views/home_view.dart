import 'package:flutter/material.dart';
import 'package:tech_blog_app/constant/component.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/constant/strings.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/models/fake_data.dart';

class HomeView extends StatelessWidget {
  const HomeView(
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
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            //? -------------------------
            const MySizedBox(height: 8),

            //? poster ------------------
            HomeScreenPoster(size: size, textTheme: textTheme),

            //? -------------------------
            const MySizedBox(height: 16),

            //? hashtag ----------------
            HomeScreenTagList(bodyMargin: bodyMargin, textTheme: textTheme),

            //?-------------------------
            const MySizedBox(height: 32),

            //? see more ---------------
            SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),

            //? blog posts -------------
            HomeScreenBlogList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            //? ------------------------
            const MySizedBox(height: 32),

            //? padcats ----------------
            SeeMorePadcast(bodyMargin: bodyMargin, textTheme: textTheme),

            //? padcats posts ----------
            HomePagePadCastList(bodyMargin: bodyMargin, size: size),

            const MySizedBox(height: 60),
          ],
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

class HomeScreenPoster extends StatelessWidget {
  const HomeScreenPoster({
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

class HomeScreenTagList extends StatelessWidget {
  const HomeScreenTagList(
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
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: MainTags(textTheme: textTheme, index: index , listItem: tagList,)
          );
        },
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class HomeScreenBlogList extends StatelessWidget {
  const HomeScreenBlogList(
      {Key? key,
      required this.size,
      required this.bodyMargin,
      required this.textTheme})
      : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  blogList[index].imageUrl.toString(),
                                ),
                                fit: BoxFit.cover),
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
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                blogList[index].writer.toString(),
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views.toString(),
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
                    blogList[index].title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        },

        //? --------------------
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class HomePagePadCastList extends StatelessWidget {
  const HomePagePadCastList(
      {Key? key, required this.bodyMargin, required this.size})
      : super(key: key);

  final Size size;
  final double bodyMargin;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            padCastList[index].imageUrl.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Align(
                    child: Text(
                      padCastList[index].title.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          );
        },

        //? --------------------
        itemCount: blogList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
