import 'package:get/route_manager.dart';
import 'package:tech_blog_app/bindings/bindings.dart';
import 'package:tech_blog_app/views/pages/articles/article_single_page.dart';
import 'package:tech_blog_app/views/pages/articles/manage_article_page.dart';
import 'package:tech_blog_app/views/pages/articles/manage_article_single_page.dart';
import 'package:tech_blog_app/views/pages/main/main_page.dart';

List<GetPage> routes = [
  GetPage(
      name: NameRoute.routeMainPage,
      page: () => MainPage(),
      binding: RegisterBinding()),
  GetPage(
      name: NameRoute.routeArticleSinglePage,
      page: () => ArticleSinglePage(),
      binding: ArticleBinding()),
  GetPage(
      name: NameRoute.routeManageArticlePage,
      page: () => ManageArticlePage(),
      binding: ArticleManagerBinding()),
  GetPage(
      name: NameRoute.routeManageArticleSinglePage,
      page: () => ManageArticleSinglePage(),
      binding: ArticleManagerBinding()),
];

class NameRoute {
  static const String routeMainPage = '/MainPage';
  static const String routeArticleSinglePage = '/ArticleSinglePage';
  static const String routeManageArticlePage = '/ManageArticlePage';
  static const String routeManageArticleSinglePage = '/ManageArticleSinglePage';
}
