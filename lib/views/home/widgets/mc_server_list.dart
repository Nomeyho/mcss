import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/views/home/widgets/mc_server_card.dart';
import 'package:provider/provider.dart';

class McServerList extends StatelessWidget {
  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).server_list_empty,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: AppTheme.medium_emphasis,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    if (state.mcServers.isEmpty) {
      return _buildEmpty(context);
    }

    return ListView(
      children: state.mcServers
          .map((s) => McServerCard(server: s))
          .toList(growable: false),
    );
  }
}
