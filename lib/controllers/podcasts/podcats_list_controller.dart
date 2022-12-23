import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog_app/core/values/api_constant.dart';
import 'package:tech_blog_app/core/values/storage.dart';
import 'package:tech_blog_app/models/podcats_model.dart';
import 'package:tech_blog_app/services/dio_service.dart';

class PodcastListController extends GetxController {
  RxBool loading = false.obs;
  RxList<PodcastModel> podcastList = RxList();

  @override
  void onInit() {
    super.onInit();
    getItems();
  }

  getItems() async {
    loading.value = true;
    var userId = GetStorage().read(StorageKey.userid);
    var response = await DioService()
        .getMethod(ApiConstant.newPodcast + userId.toString());

    if (response.statusCode == 200) {
      for (var element in response) {
        podcastList.add(PodcastModel.fromJson(element));
      }
    }
    loading.value = false;
  }
}
