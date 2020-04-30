import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:provider/provider.dart';

class MotdSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AppState>(context).mcServerStatus,
      builder: (context, AsyncSnapshot<StatusResponse> snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: ChatObjectText(rootChatObject: snapshot.data.description),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
