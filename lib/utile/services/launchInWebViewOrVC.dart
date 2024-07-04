import 'package:url_launcher/url_launcher.dart';

Future<void> launchInWebViewOrVc(Uri url) async {
  if (await launchUrl(
    url,
    mode: LaunchMode.platformDefault,
    webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'}),
  )) {
    throw 'Could not launch $url';
  }
}
