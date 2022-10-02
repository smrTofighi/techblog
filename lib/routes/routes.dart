import 'package:get/route_manager.dart';
import 'package:tech_blog_app/bindings.dart';
import 'package:tech_blog_app/views/main_view/main_view.dart';

import '../views/articles/article_single_view.dart';

List<GetPage> routes = [
  GetPage(name: routeMainView, page: () => MainView(), binding: RegisterBinding()),
  GetPage(name: routeArticleSingleView, page: () => ArticleSingleView(), binding: ArticleBinding()),
];

const String routeMainView = '/MainView';
const String routeArticleSingleView = '/ArticleSingleView';