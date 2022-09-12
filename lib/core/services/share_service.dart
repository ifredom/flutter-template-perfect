import 'package:share_plus/share_plus.dart';

/// wrapper around [Share] package
class ShareService {
  /// Fires platform's share inteface
  share(String text) async {
    await Share.share(text);
  }
}
