import 'package:tech_blog_app/core/values/api_constant.dart';

class PodcastFileModel {
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? lenght;

  PodcastFileModel();

  PodcastFileModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    podcastId = element["podcast_id"];
    file = ApiConstant.hostDlUrl + element["file"];
    title = element["title"];
    lenght = element["length"];
  }
}
