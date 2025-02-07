import 'package:url_launcher/url_launcher.dart';

class OpenLinkService {
  /// Opens the given [url]
  ///
  /// Throws error if the link can't be opened
  Future openLink(String url) async {
    final Uri _url = Uri.parse(url);

    // 需要手动更改： https://pub.dev/packages/url_launcher
    // Check if the url can be launched
    // bool canLaunchUrl = await canLaunchUrl(url);
    // if (!canLaunchUrl) return Result.failed("Could not launch $url");

    await launchUrl(_url);
  }
}
