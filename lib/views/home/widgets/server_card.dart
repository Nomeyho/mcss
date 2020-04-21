import 'package:flutter/material.dart';
import 'package:mcss/domain/server.dart';

class ServerCard extends StatelessWidget {
  final Server server;

  const ServerCard({
    Key key,
    this.server,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(server.toString());
  }
}
