import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:provider/provider.dart';

class PingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AppState>(context).mcServerStatus;

    return Text('${status.ms}');
  }
}
