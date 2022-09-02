import 'package:get/get.dart';
import 'package:tech_blog_app/models/article_model.dart';
import '../constant/api_constant.dart';
import '../services/dio_service.dart';



class SingleArticleController extends GetxController{

  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  @override
  void onInit() {
    super.onInit();

  }

  getArticleInfo() async {

    
  }
}