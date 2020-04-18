import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mcss/app.dart';
import 'package:mcss/app_logger.dart';
import 'package:mcss/app_state.dart';
import 'package:provider/provider.dart';

void main() async {
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppLogger.init();

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (_) => AppState()),
      ],
      child: Directionality(
        child: App(),
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
