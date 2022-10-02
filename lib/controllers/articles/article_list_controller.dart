import 'package:get/get.dart';
import 'package:tech_blog_app/models/article_model.dart';
import '../../constant/api_constant.dart';
import '../../services/dio_service.dart';


class ArticleListController extends GetxController{
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    // TODO get userid from getstorage ApiConstant.getArticleList + userId 
    var response = await DioService().getMethod(ApiConstant.getArticleList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      

      
      loading.value = false;
      
    }
  }

  getArticleListWithTagsId(String id) async {
    loading.value = true;
    articleList.clear();
    // TODO get userid from getstorage ApiConstant.getArticleList + userId 
    var response = await DioService().getMethod(ApiConstant.baseUrl + 'article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      

      
      loading.value = false;

    }
  }
}