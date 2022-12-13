import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tech_blog_app/controllers/articles/manage_article_controller.dart';

import '../../widgets/component.dart';

// ignore: must_be_immutable
class ArticleContentEditorPage extends StatelessWidget {
  ArticleContentEditorPage({Key? key}) : super(key: key);
  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appBar('نوشتن / ویرایش مقاله'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'بدنه مقاله ت رو اینجا بنویس ...',
                  shouldEnsureVisible: true,
                  initialText: manageArticleController
                      .articleInfoModel
                      .value
                      .content!,
                ),
                callbacks: Callbacks(
                  onChangeContent: (content) {
                    manageArticleController.articleInfoModel.update((val) {
                      val?.content = content;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
