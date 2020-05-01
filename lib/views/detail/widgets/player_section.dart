import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/player.dart';
import 'package:dart_mc_ping/model/players.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:mcss/widgets/mc_card.dart';
import 'package:mcss/widgets/section_header.dart';
import 'package:provider/provider.dart';

class PlayerSection extends StatelessWidget {
  static final NumberFormat f = NumberFormat('#,###,###');

  Widget _buildTitle(Players players) {
    return SectionHeader(
      title: 'Online players: ',
      subtitle: '${f.format(players.online)}/${f.format(players.max)}',
    );
  }

  Widget _buildPlayer(Player player) {
    final uuid = player.id.replaceAll('-', '');
    final name = ChatObject.fromString(player.name).normalize();

    return McCard(
      icon: Image.network('https://minotar.net/avatar/$uuid/100', width: 50),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ChatObjectText(rootChatObject: name),
          Text(
            player.id,
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppTheme.disabled,
            ),
          )
        ],
      ),
      trailing: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AppState>(context).mcServerStatus;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(status.players),
        ...status.players.sample
            .map((p) => _buildPlayer(p))
            .toList(growable: false),
      ],
    );
  }
}
