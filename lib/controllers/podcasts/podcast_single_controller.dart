import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/core/values/api_constant.dart';
import 'package:tech_blog_app/models/podcast_file_model.dart';
import 'package:tech_blog_app/services/dio_service.dart';

class PodcastSingleController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getPodcastFiles();
  }

  var id;
  PodcastSingleController({required this.id});
  RxBool loading = false.obs;
  RxList<PodcastFileModel> podcastFileList = RxList();
  getPodcastFiles() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.podcastFiles + id);
    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        var podcastFileModel = PodcastFileModel.fromJson(element);
        podcastFileList.add(podcastFileModel);
      }
      debugPrint('finish');
      loading.value = false;
    }
  }
}
