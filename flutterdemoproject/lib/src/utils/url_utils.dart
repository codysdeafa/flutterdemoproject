import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routers/pages_path.dart';

const String urlZalo = 'zalo.me';
const String urlTg = 't.me';
const String urlTwitter = 'twitter.com';
const String urlTiktok = 'tiktok.com';
const String urlFacebook = 'facebook.com';
const String urlInstagram = 'instagram.com';
const String urlYoutube = 'youtube.com';
const String urlWeChat = 'weixin.qq';

///外跳浏览器
Future<bool> launchInBrowser(String? url) async {
  if (url == null || url.isEmpty) return false;
  try {
    return await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication);
  } catch (e) {
    return false;
  }
}


bool needLaunchInBrowser(String? url) {
  return url != null &&
      (url.contains(urlZalo) ||
          url.contains(urlTg) ||
          url.contains(urlTwitter) ||
          url.contains(urlTiktok) ||
          url.contains(urlInstagram) ||
          url.contains(urlYoutube) ||
          url.contains(urlWeChat) ||
          url.contains(urlFacebook));
}
