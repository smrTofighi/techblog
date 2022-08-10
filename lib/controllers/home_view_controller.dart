import 'package:get/get.dart';
import 'package:tech_blog_app/constant/api_constant.dart';
import 'package:tech_blog_app/models/article_model.dart';
import 'package:tech_blog_app/models/padcats_model.dart';
import 'package:tech_blog_app/models/poster_model.dart';
import 'package:tech_blog_app/services/dio_service.dart';

class HomeViewController extends GetxController{
  late Rx<PosterModel> poster;
  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PadcastModel> topPadcasts = RxList();
    @override
  void onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async{
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if(response.statusCode==200){
      response.data['top_visited'].forEach((element){
      topVisitedList.add(ArticleModel.fromJson(element));
    });

    response.data['top_podcasts'].forEach((element){
      topPadcasts.add(PadcastModel.fromJson(element));
    });
    }

  }


}