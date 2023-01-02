import 'package:get/get.dart';
import 'package:tech_blog_app/controllers/articles/manage_article_controller.dart';
import 'package:tech_blog_app/controllers/podcasts/podcast_single_controller.dart';
import 'package:tech_blog_app/controllers/podcasts/podcats_list_controller.dart';
import 'package:tech_blog_app/controllers/register/register_controller.dart';
import '../controllers/articles/article_list_controller.dart';
import '../controllers/articles/article_single_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticleListController());
    Get.lazyPut(() => ArticleSingleController());
  }
}

class ArticleManagerBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ManageArticleController());
    Get.lazyPut(() => ManageArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class PodcastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PodcastListController());
  }
}
