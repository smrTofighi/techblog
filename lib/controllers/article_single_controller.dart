import 'package:get/get.dart';
import 'package:tech_blog_app/constant/api_constant.dart';
import 'package:tech_blog_app/models/article_info_model.dart';
import 'package:tech_blog_app/models/article_model.dart';
import 'package:tech_blog_app/models/tag_model.dart';
import 'package:tech_blog_app/services/dio_service.dart';

class ArticleSingleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<ArticleModel> relatedList = RxList();
  RxList<TagModel> tags = RxList();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  getArticleInfo() async {
    loading.value = true;
    //TODO: user id is hard code
    var userId = '';
    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      
        articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
        relatedList.clear();
        response.data['related'].forEach((element){
          relatedList.add(ArticleModel.fromJson(element));
        });
        tags.clear();
        response.data['tags'].forEach((element){
          tags.add(TagModel.fromJson(element));
        });
      
    }
    
    loading.value = false;
  }
}
