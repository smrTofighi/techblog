import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/controllers/list_article_controller.dart';
import 'package:tech_blog_app/controllers/single_article_controller.dart';
import 'package:tech_blog_app/views/article_single_view.dart';

import '../constant/colors.dart';
import '../constant/component.dart';

class ArticleListView extends StatelessWidget {
  ArticleListView({Key? key}) : super(key: key);
  ListArticleController listArticleController = Get.put(ListArticleController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مقالات جدید'),
        body: SizedBox(
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => InkWell(
                onTap: ((){
                  singleArticleController.id.value = int.parse(listArticleController.articleList[index].id!);
                  Get.to(const ArticleSingleView());
                }),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height / 8,
                        width: Get.width / 4,
                        child: CachedNetworkImage(
                          imageUrl: listArticleController.articleList[index].image!,
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
                              listArticleController.articleList[index].title!,
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
                                listArticleController.articleList[index].author!,
                                style: textTheme.headline4,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                listArticleController.articleList[index].view! +
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
              itemCount: listArticleController.articleList.length,
            ),
          ),
        ),
      ),
    );
  }
}
