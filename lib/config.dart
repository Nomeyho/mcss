import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:logging/logging.dart';

class Config {
  static final log = Logger('MCSS.Config');
  static final bool debug = false;

  static String get appId {
    if (debug) {
      return BannerAd.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3227008925572350~6585502458';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3227008925572350~7124558500';
    } else {
      log.config(
          'App ID not available on platform ${Platform.operatingSystem}');
      return null;
    }
  }

  static String get adId {
    if (debug) {
      return BannerAd.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3227008925572350/9422105704';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3227008925572350/7571281061';
    } else {
      log.config('Ad ID not available on platform ${Platform.operatingSystem}');
      return null;
    }
  }
}
