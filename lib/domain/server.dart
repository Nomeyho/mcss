import 'package:flutter/material.dart';
import 'package:mcss/generated/i18n.dart';

class Server {
  final String hostname;
  final int port;

  Server(this.hostname, this.port);

  @override
  String toString() {
    return '$hostname:$port';
  }

  static Server parse(final String str) {
    final tokens = str.split(':');
    final hostname = tokens[0];
    final port = int.parse(tokens[1]);
    return Server(hostname, port);
  }

  /*
  TODO use in add widget
  static Server parse(final String str, final BuildContext context) {
    if (str == null || str.isEmpty) {
      throw Exception(S.of(context).error_empty_up);
    }

    if (str.contains(':')) {
      final tokens = str.split(':');
      final hostname = tokens[0];
      final port = _parsePort(tokens[1], context);
      return Server(hostname, port);
    }

    return Server(str, 25565);
  }

  static int _parsePort(final String str, final BuildContext context) {
    final port = int.tryParse(str);

    if (port == null) {
      throw Exception(S.of(context).error_invalid_port);
    } else if (port < 0) {
      throw Exception(S.of(context).error_negative_port);
    } else if (port > 65535) {
      throw Exception(S.of(context).error_too_large_port);
    }

    return port;
  }
  */
}
