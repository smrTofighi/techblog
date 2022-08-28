import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/controllers/article_controller.dart';

import '../constant/component.dart';

class ArticleListView extends StatelessWidget {
  ArticleListView({Key? key}) : super(key: key);
  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مقالات جدید'),
        body: SizedBox(
          child: Obx(
            () => ListView.builder(
              itemBuilder: (context, index) =>
                  Text(articleController.articleList[index].title!),
              itemCount: articleController.articleList.length,
            ),
          ),
        ),
      ),
    );
  }
}
