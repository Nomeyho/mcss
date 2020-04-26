import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/views/home/widgets/mc_server_card.dart';
import 'package:mcss/views/home/widgets/mojang_server_card.dart';
import 'package:provider/provider.dart';

class ServerList extends StatelessWidget {
  Widget _buildLoader() {
    return SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildServerList(AppState state) {
    switch (state.category) {
      case Category.myServers:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => McServerCard(server: state.mcServers[index]),
            childCount: state.mcServers.length,
          ),
        );
      case Category.mojang:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => MojangServerCard(server: state.mojangServers[index]),
            childCount: state.mojangServers.length,
          ),
        );
        break;
      default:
        throw Exception('Unexpected category ${state.category}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return SliverPadding(
      padding: EdgeInsets.all(12),
      sliver: state.loading ? _buildLoader() : _buildServerList(state),
    );
  }
}
