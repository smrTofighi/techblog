import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/constant/colors.dart';
import 'package:tech_blog_app/constant/component.dart';
import 'package:tech_blog_app/constant/strings.dart';
import 'package:tech_blog_app/controllers/articles/manage_article_controller.dart';
import 'package:tech_blog_app/gen/assets.gen.dart';
import 'package:tech_blog_app/routes/routes.dart';

// ignore: must_be_immutable
class ManageArticleView extends StatelessWidget {
  ManageArticleView({Key? key}) : super(key: key);

  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar('مدیریت مقاله'),
        body: Obx(
          () => manageArticleController.loading.value
              ? const Center(
                  child: SpinKitFoldingCube(
                    color: SolidColors.primery,
                    size: 32.0,
                  ),
                )
              : manageArticleController.articleList.isNotEmpty
                  ? publishedArticlesByMe(textTheme)
                  : articleEmptyState(textTheme),
        ),
        bottomNavigationBar: elevatedButton(),
        extendBody: true, //? bottom navigation has not background
      ),
    );
  }

  Widget elevatedButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(12,0,12,12),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(NameRoute.routeManageArticleSingleView);
          },
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(Get.width / 4, 56),
            ),
          ),
          child: const Text(
            ValueStrings.letsGoToWriteArticle,
          ),
        ),
      );
  }

  ListView publishedArticlesByMe(TextTheme textTheme) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => InkWell(
        onTap: () async {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 8,
                width: Get.width / 4,
                child: CachedNetworkImage(
                  imageUrl: manageArticleController.articleList[index].image!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
                  placeholder: (context, url) => const Center(
                    child: SpinKitDoubleBounce(
                      color: SolidColors.primery,
                      size: 32,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    child: Text(
                      manageArticleController.articleList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        manageArticleController.articleList[index].author!,
                        style: textTheme.headline4,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        manageArticleController.articleList[index].view! +
                            'بازدید',
                        style: textTheme.headline4,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      itemCount: manageArticleController.articleList.length,
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.techBotSad.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: ValueStrings.noArticlesAdd,
                style: textTheme.headline4,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
