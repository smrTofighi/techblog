import 'package:get/get.dart';
import 'package:tech_blog_app/constant/api_constant.dart';
import 'package:tech_blog_app/models/article_model.dart';
import 'package:tech_blog_app/models/padcats_model.dart';
import 'package:tech_blog_app/models/poster_model.dart';
import 'package:tech_blog_app/models/tag_model.dart';
import 'package:tech_blog_app/services/dio_service.dart';

class HomeViewController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PadcastModel> topPadcasts = RxList();
  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPadcasts.add(PadcastModel.fromJson(element));
      });

      response.data['tags'].forEach((element) {
        tagsList.add(TagModel.fromJson(element));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
