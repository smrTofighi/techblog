class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;
  PodcastModel(
      {required this.id,
      required this.title,
      required this.poster,
      required this.publisher,
      required this.view,
      required this.createdAt});

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    poster = 'https://techblog.sasansafari.com' + element['poster'];
    publisher = element['author'];
    view = element['view'];
    createdAt = element['created_at'];
  }
}
