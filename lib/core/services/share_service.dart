import 'package:share/share.dart';

/// wrapper around [Share] package
class ShareService {
  /// Fires platform's share inteface
  share(String text) async {
    await Share.share(text);
  }
}
