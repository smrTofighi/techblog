import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/constant/text_style.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import '../constant/strings.dart';


class ArticleSingleView extends StatelessWidget {
  const ArticleSingleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'این یک پیام برای تست هست تا نتیجه کار را بهتر بتونیم ببینیم پس نگران نباشد.',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                      image: Image.asset(Assets.images.avatar.path).image,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'سیدمحمد رضاتوفیقی',
                      style: textTheme.headline4,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'تاریخ',
                      style: textTheme.headline4,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                  """
        <h1>I am the title of the story.</h1>
        <h2>I am the title of the story.</h2>
        <h3>I am the title of the story.</h3>
        <h4>I am the title of the story.</h4>
        <h5>I am the title of the story.</h5>
        """,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      const Center(
                    child: SpinKitDoubleBounce(
                      color: SolidColors.primery,
                      size: 32,
                    ),
                  ),
                  textStyle: TextStyles.contentArticleSingleViewTextStyle,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              tagsList(textTheme),
              relatedArticlesText(textTheme),
              SizedBox(
                height: size.height / 3.5,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
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
                                        image: Image.asset(
                                                Assets.images.posterTest.path)
                                            .image,
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
                                          'محمد توفیقی',
                                          style: textTheme.subtitle1,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '235',
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
                              'هجوم برنامه نویسان به پلتفرم فلاتر، آینده اندروید در دست این پلتفرم',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: textTheme.headline4,
                            ),
                          ),
                        ],
                      ),
                    );
                  },

                  //? --------------------
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 25,)
            ],
          ),
        ),
      ),
    );
  }

  Padding relatedArticlesText(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(right: 32, bottom: 8, top: 32),
      child: Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            ValueStrings.relatedArticle,
            style: textTheme.headline3,
          ),
        ),
      ),
    );
  }

  SizedBox tagsList(TextTheme textTheme) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 25,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                color: Color.fromARGB(255, 242, 242, 242)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'بازی کامپیوتری',
                  style: textTheme.headline4,
                ),
              ),
            ),
          ),
        ),
        itemCount: 3,
      ),
    );
  }
}
