import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class AppOpen {
  static void url(String url) async {
    try {
      !await launchUrl(Uri.parse(url));
    } catch (e) {
      log(e.toString());
    }
  }
}
