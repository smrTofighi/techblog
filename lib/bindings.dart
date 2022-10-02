import 'package:get/get.dart';
import 'package:tech_blog_app/controllers/register_controller.dart';

import 'controllers/articles/article_list_controller.dart';
import 'controllers/articles/article_single_controller.dart';

class ArticleBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ArticleListController());
    Get.lazyPut(() => ArticleSingleController());
  }

}

class RegisterBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());
  }

}