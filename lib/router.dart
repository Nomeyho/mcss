import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mcss/views/home/home_view.dart';

class Router {
  static final log = Logger('Router');

  static get root => home;
  static const home = '/';

  static Route generateRoute(final RouteSettings settings) {
    log.info('Navitaging to ${settings.name}');

    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        throw new Exception('Unexpected route ${settings.name}');
    }
  }
}
