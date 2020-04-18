import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:logging/logging.dart';

class Config {
  static final log = Logger('Config');
  static final bool debug = false;

  static String get appId {
    if (debug) {
      return BannerAd.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3227008925572350~5776810094';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3227008925572350~8772537749';
    } else {
      log.config('App ID not available on platform ${Platform.operatingSystem}');
      return null;
    }
  }

  static String get adId {
    if (debug) {
      return BannerAd.testAdUnitId;
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3227008925572350/6492014015';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3227008925572350/1099198484';
    } else {
      log.config('Ad ID not available on platform ${Platform.operatingSystem}');
      return null;
    }
  }
}
