import 'package:get/get.dart';
import 'package:tech_blog_app/core/values/api_constant.dart';
import 'package:tech_blog_app/models/podcast_file_model.dart';
import 'package:tech_blog_app/services/dio_service.dart';

class PodcastSingleController extends GetxController {
  var id;
  PodcastSingleController({this.id});
  RxBool loading = false.obs;
  RxList<PodcastFileModel> podcastFileList = RxList();
  getPodcastFiles() async {
    loading.value = true;
    var response =
        await DioService().getMethod(ApiConstant.podcastFiles + id.toString());
    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        podcastFileList.add(PodcastFileModel.fromJson(element));
      }
      loading.value = false;
    }
  }
}
