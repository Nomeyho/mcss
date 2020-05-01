import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/widgets/section_header.dart';
import 'package:provider/provider.dart';

class PlayerSection extends StatelessWidget {
  static final NumberFormat f = NumberFormat('#,###,###');

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<AppState>(context).mcServerStatus.players;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SectionHeader(
          title: 'Online players: ',
          subtitle: '${f.format(players.online)}/${f.format(players.max)}',
        ),
      ),
    );
  }
}
