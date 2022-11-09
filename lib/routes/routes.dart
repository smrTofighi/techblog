import 'package:get/route_manager.dart';
import 'package:tech_blog_app/bindings/bindings.dart';
import 'package:tech_blog_app/routes/pages.dart';
import 'package:tech_blog_app/views/pages/articles/article_single_page.dart';
import 'package:tech_blog_app/views/pages/articles/manage_article_page.dart';
import 'package:tech_blog_app/views/pages/articles/manage_article_single_page.dart';
import 'package:tech_blog_app/views/pages/main/main_page.dart';

List<GetPage> routes = [
  GetPage(
      name: NameRoutes.routeMainPage,
      page: () => MainPage(),
      binding: RegisterBinding()),
  GetPage(
      name: NameRoutes.routeArticleSinglePage,
      page: () => ArticleSinglePage(),
      binding: ArticleBinding()),
  GetPage(
      name: NameRoutes.routeManageArticlePage,
      page: () => ManageArticlePage(),
      binding: ArticleManagerBinding()),
  GetPage(
      name: NameRoutes.routeManageArticleSinglePage,
      page: () => ManageArticleSinglePage(),
      binding: ArticleManagerBinding()),
];
