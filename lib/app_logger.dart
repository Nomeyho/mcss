import 'package:logging/logging.dart';

class AppLogger {
  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print(
          '[${record.level.name}] ${record.time} | ${record.loggerName} | ${record.message}');
    });
  }
}
