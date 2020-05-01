import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mcss/views/detail/detail_view.dart';
import 'package:mcss/views/home/home_view.dart';

class Router {
  static final log = Logger('MCSS.Router');

  static get root => home;
  static const home = '/';
  static const detail = '/detail';

  static Route generateRoute(final RouteSettings settings) {
    log.info('Navitaging to ${settings.name}');

    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case detail:
        return MaterialPageRoute(builder: (_) => DetailView());

      default:
        throw new Exception('Unexpected route ${settings.name}');
    }
  }

  static _buildDebugRoute(Widget view) {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 5),
      pageBuilder: (_, __, ___) => view,
    );
  }
}
