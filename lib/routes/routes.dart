import 'package:get/route_manager.dart';
import 'package:tech_blog_app/bindings.dart';
import 'package:tech_blog_app/views/articles/manage_article_single_view.dart';
import 'package:tech_blog_app/views/articles/manage_article_view.dart';
import 'package:tech_blog_app/views/main_view/main_view.dart';

import '../views/articles/article_single_view.dart';

List<GetPage> routes = [
  GetPage(
      name: NameRoute.routeMainView,
      page: () => MainView(),
      binding: RegisterBinding()),
  GetPage(
      name: NameRoute.routeArticleSingleView,
      page: () => ArticleSingleView(),
      binding: ArticleBinding()),
  GetPage(
      name: NameRoute.routeManageArticleView,
      page: () => ManageArticleView(),
      binding: ArticleManagerBinding()),
  GetPage(
      name: NameRoute.routeManageArticleSingleView,
      page: () => ManageArticleSingleView(),
      binding: ArticleManagerBinding()),
];

class NameRoute {
  static const String routeMainView = '/MainView';
  static const String routeArticleSingleView = '/ArticleSingleView';
  static const String routeManageArticleView = '/ManageArticleView';
  static const String routeManageArticleSingleView = '/ManageArticleSingleView';
}
