import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/views/home/widgets/server_card.dart';
import 'package:provider/provider.dart';

class ServerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final servers = Provider.of<AppState>(context).servers;

    return SliverPadding(
      padding: EdgeInsets.all(12),
      sliver: Container(
        child: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => ServerCard(server: servers[index]),
            childCount: servers.length,
          ),
        ),
      ),
    );
  }
}
