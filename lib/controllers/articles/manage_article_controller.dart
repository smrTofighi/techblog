import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_app/models/article_info_model.dart';
import 'package:tech_blog_app/models/article_model.dart';
import 'package:tech_blog_app/models/tag_model.dart';
import '../../core/values/api_constant.dart';
import '../../core/values/storage.dart';
import '../../services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagModel> tags = RxList.empty();
  RxBool loading = false.obs;
  TextEditingController titleEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
    title: 'اینجا باید سرتیتر خبر رو بنویسی',
    content: '''
اینجا باید محتوا خبر رو بنویسی، نوشته بالای آبی رو لمس کن تا وارد صفحه ویرایش بشی.''',
    image: '',
  ).obs;

  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }

  updateTitle() {
    articleInfoModel.update((val) {
      val!.title = titleEditingController.text;
    });
  }

  getManagedArticle() async {
    loading.value = true;
    var userId = GetStorage().read(StorageKey.userid);
    var response =
        await DioService().getMethod(ApiConstant.publishedByMe + userId);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
