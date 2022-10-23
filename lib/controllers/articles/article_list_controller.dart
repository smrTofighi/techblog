import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_app/models/article_model.dart';
import '../../core/values/api_constant.dart';
import '../../core/values/storage.dart';
import '../../services/dio_service.dart';

class ArticleListController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    var userId = GetStorage().read(StorageKey.userid);
    var response =
        await DioService().getMethod(ApiConstant.getArticleList + userId);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }

  getArticleListWithTagsId(String id) async {
    var userId = GetStorage().read(StorageKey.userid);
    loading.value = true;
    articleList.clear();
    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
