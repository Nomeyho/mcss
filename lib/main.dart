import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mcss/app.dart';
import 'package:mcss/app_logger.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/services/server_service.dart';
import 'package:provider/provider.dart';

void main() async {
  final ServerService serverService = ServerService();

  WidgetsFlutterBinding.ensureInitialized();
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppLogger.init();

  serverService.loadServers().then((_) {
    print('ok');
  });

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (_) => AppState(serverService)),
      ],
      child: Directionality(
        child: App(),
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
