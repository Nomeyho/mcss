import 'package:logging/logging.dart';

class AppLogger {
  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (record.loggerName.startsWith("MCSS")) {
        print(
            '[${record.level.name}] ${record.time} | ${record.loggerName} | ${record.message}');
      }
    });
  }
}
