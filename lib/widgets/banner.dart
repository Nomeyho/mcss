import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mcss/config.dart';

class Banner extends StatefulWidget {
  static Widget bottomPadding = SliverPadding(
    padding: EdgeInsets.only(bottom: AdSize.banner.height.toDouble()),
  );

  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  static final log = Logger('Banner');

  BannerAd _banner;
  AdSize _size = AdSize.banner;

  BannerAd _createBanner() {
    if (!Platform.isAndroid && !Platform.isIOS) {
      log.warning("Cannot display ads on ${Platform.operatingSystem}");
      return null;
    }

    FirebaseAdMob.instance.initialize(appId: Config.appId);
    return BannerAd(
      adUnitId: Config.adId,
      size: _size,
      targetingInfo: MobileAdTargetingInfo(
        keywords: ['Minecraft', 'Game', 'Server', 'Ping', 'French'],
        childDirected: true,
        testDevices: [
          '7de57089f51ec6257cfd0f200760878f', // iOS - IPhone6s
          '999EDE1C51D20FCE0C8E327D46EBF1B0', // Android - Huawei
        ],
      ),
    );
  }

  @override
  void initState() {
    _banner = _createBanner();
    if (_banner != null) {
      _banner.load();
      _banner.show();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_banner != null) {
      _banner.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
