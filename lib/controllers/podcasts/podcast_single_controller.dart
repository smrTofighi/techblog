import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tech_blog_app/core/values/api_constant.dart';
import 'package:tech_blog_app/models/podcast_file_model.dart';
import 'package:tech_blog_app/services/dio_service.dart';

class PodcastSingleController extends GetxController {
  var id;
  PodcastSingleController({required this.id});
  RxBool loading = false.obs;
  RxList<PodcastFileModel> podcastFileList = RxList();
  late var playList;
  RxBool playState = false.obs;
  final player = AudioPlayer();
  RxInt currentIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();

    playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: [],
    );
    await getPodcastFiles();
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  getPodcastFiles() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.podcastFiles + id);
    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        var podcastFileModel = PodcastFileModel.fromJson(element);
        podcastFileList.add(podcastFileModel);
        playList.add(AudioSource.uri(Uri.parse(podcastFileModel.file!)));
      }
      loading.value = false;
    }
  }
}
