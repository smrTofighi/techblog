import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/constant/component.dart';
import 'package:tech_blog_app/constant/text_style.dart';
import 'package:tech_blog_app/controllers/article_list_controller.dart';
import 'package:tech_blog_app/controllers/article_single_controller.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/views/article_list_view.dart';
import '../constant/strings.dart';

class ArticleSingleView extends StatelessWidget {
  ArticleSingleController articleSingleController =
      Get.put(ArticleSingleController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => articleSingleController.loading.value
                ? SizedBox(
                    height: Get.height,
                    child: const Center(
                      child: SpinKitDoubleBounce(
                        color: SolidColors.primery,
                        size: 32,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                              imageUrl: articleSingleController
                                  .articleInfoModel.value.image!,
                              imageBuilder: (context, imageProvider) =>
                                  Image(image: imageProvider),
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
                                      colors:
                                          GradiantColors.singleAppBarGradiant,
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(onPressed: (){
                                    Get.back();
                                  }, icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),),
                                  const Expanded(child: SizedBox()),
                                  const Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(onPressed: (){
                                    myLaunchUrl(articleSingleController.articleInfoModel.value.title!);
                                  }, icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 24,
                                  ),),
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
                          articleSingleController.articleInfoModel.value.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image(
                              image:
                                  Image.asset(Assets.images.avatar.path).image,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              articleSingleController
                                  .articleInfoModel.value.author!,
                              style: textTheme.headline4,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              articleSingleController
                                  .articleInfoModel.value.createdAt!,
                              style: textTheme.headline4,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HtmlWidget(
                          articleSingleController
                              .articleInfoModel.value.content!,
                          enableCaching: true,
                          onLoadingBuilder:
                              (context, element, loadingProgress) =>
                                  const Center(
                            child: SpinKitDoubleBounce(
                              color: SolidColors.primery,
                              size: 32,
                            ),
                          ),
                          textStyle:
                              TextStyles.contentArticleSingleViewTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      tagsList(textTheme),
                      relatedArticlesText(textTheme),
                      relatedArticles(textTheme, size),
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

  Widget relatedArticles(TextTheme textTheme, Size size) {
    double bodyMargin = size.width / 10;
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              articleSingleController.getArticleInfo(
                  articleSingleController.relatedList[index].id);
            },
            child: Padding(
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
                            imageUrl: articleSingleController
                                .relatedList[index].image!,
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
                                )),
                            placeholder: (context, url) =>
                                const SpinKitFoldingCube(
                              color: SolidColors.primery,
                              size: 32.0,
                            ),
                            errorWidget: (context, url, error) => const Icon(
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  articleSingleController
                                      .relatedList[index].author!,
                                  style: textTheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      articleSingleController
                                          .relatedList[index].view!,
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
                      articleSingleController.relatedList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
          );
        },

        //? --------------------
        itemCount: articleSingleController.relatedList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget relatedArticlesText(TextTheme textTheme) {
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

  Widget tagsList(TextTheme textTheme) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () async {
              await Get.find<ArticleListController>().getArticleListWithTagsId(
                  articleSingleController.tags[index].id!);
              var titleAppBar = articleSingleController.tags[index].title!;
              Get.to(ArticleListView(
                titleAppBar: titleAppBar,
              ));
            },
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
                    articleSingleController.tags[index].title!,
                    style: textTheme.headline4,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: articleSingleController.tags.length,
      ),
    );
  }
}
