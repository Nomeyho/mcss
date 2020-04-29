import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:provider/provider.dart';

class PingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AppState>(context).mcServerStatus,
      builder: (context, AsyncSnapshot<StatusResponse> snapshot) {
        if (snapshot.hasData) {
          return Text('${snapshot.data.ms}');
        } else {
          return Container();
        }
      },
    );
  }
}
