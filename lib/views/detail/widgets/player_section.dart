import 'package:dart_mc_ping/model/player.dart';
import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:provider/provider.dart';

class PlayerSection extends StatelessWidget {
  Widget _buildPlayer(Player player) {
    final uuid = player.id.replaceAll('-', '');
    return Row(
      children: <Widget>[
        Image.network('https://minotar.net/avatar/$uuid/100', width: 100),
        Text(player.name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO list player name + uuid + icon from minotar
    // TODO create chatObject from player player
    // TODO externalize MOTD colored text & reuse here
    return FutureBuilder(
      future: Provider.of<AppState>(context).mcServerStatus,
      builder: (context, AsyncSnapshot<StatusResponse> snapshot) {
        if (snapshot.hasData) {
          return Column(children: <Widget>[
            Text(
                '${snapshot.data.players.online} / ${snapshot.data.players.max}'),
            ...snapshot.data.players.sample
                .map((p) => _buildPlayer(p))
                .toList(growable: false),
          ]);
        } else {
          return Container();
        }
      },
    );
  }
}
