import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mcss/app.dart';
import 'package:mcss/app_logger.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/services/mc_server_service.dart';
import 'package:mcss/services/mojang_server_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  AppLogger.init();


  final AppState appState = AppState(McServerService(), MojangServerService());
  appState.category = Category.myServers;

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(create: (_) => appState),
      ],
      child: App(),
    ),
  );
}
