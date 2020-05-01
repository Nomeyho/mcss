import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/player.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:mcss/widgets/error_image.dart';
import 'package:mcss/widgets/loading_image.dart';
import 'package:mcss/widgets/mc_card.dart';
import 'package:provider/provider.dart';

class PlayerListSection extends StatelessWidget {
  static final NumberFormat f = NumberFormat('#,###,###');

  Widget _buildPlayer(Player player) {
    final uuid = player.id.replaceAll('-', '');
    final name = ChatObject.fromString(player.name).normalize();

    return McCard(
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: CachedNetworkImage(
          imageUrl: 'https://minotar.net/avatar/$uuid/100',
          placeholder: (context, url) => LoadingImage(width: 50, height: 50),
          errorWidget: (context, url, error) => ErrorImage(width: 50, height: 50),
          width: 50,
          height: 50,
        ),
      ),
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
    final players =
        Provider.of<AppState>(context).mcServerStatus.players.sample;

    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index < players.length) {
            return _buildPlayer(players[index]);
          } else {
            return null;
          }
        }),
      ),
    );
  }
}
