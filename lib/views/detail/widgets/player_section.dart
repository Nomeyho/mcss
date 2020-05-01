import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/player.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:provider/provider.dart';

class PlayerSection extends StatelessWidget {
  Widget _buildPlayer(Player player) {
    final uuid = player.id.replaceAll('-', '');
    final name = ChatObject.fromString(player.name).normalize();
    return Row(
      children: <Widget>[
        Image.network('https://minotar.net/avatar/$uuid/100', width: 100),
        ChatObjectText(rootChatObject: name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AppState>(context).mcServerStatus;
    return Column(children: <Widget>[
      Text('${status.players.online} / ${status.players.max}'),
      ...status.players.sample
          .map((p) => _buildPlayer(p))
          .toList(growable: false),
    ]);
  }
}
