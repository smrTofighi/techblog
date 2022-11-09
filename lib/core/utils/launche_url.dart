import 'package:url_launcher/url_launcher.dart';

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    await launchUrl(uri);
  }
}
