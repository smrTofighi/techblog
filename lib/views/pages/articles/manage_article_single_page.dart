import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/views/widgets/component.dart';
import 'package:tech_blog_app/core/styles/text_style.dart';
import 'package:tech_blog_app/controllers/articles/manage_article_controller.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import '../../../core/values/colors.dart';

// ignore: must_be_immutable
class ManageArticleSinglePage extends StatelessWidget {
  var manageArticleController = Get.find<ManageArticleController>();

  ManageArticleSinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          manageArticleController.articleInfoModel.value.image!,
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
                              begin: Alignment.topCenter),
                        ),
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
                            const Icon(
                              Icons.bookmark_border_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              onPressed: () {
                                myLaunchUrl(manageArticleController
                                    .articleInfoModel.value.title!);
                              },
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
                  child: Text(
                    manageArticleController.articleInfoModel.value.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                    maxLines: 2,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(
                    manageArticleController.articleInfoModel.value.content!,
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
                // tagsList(textTheme),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tagsList(TextTheme textTheme) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () async {},
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
                    manageArticleController.tags[index].title!,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: manageArticleController.tags.length,
      ),
    );
  }
}
