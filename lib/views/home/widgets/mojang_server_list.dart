import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/views/home/widgets/mojang_server_card.dart';
import 'package:provider/provider.dart';

class MojangServerList extends StatelessWidget {
  Widget _buildLoader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).server_list_error,
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

    if (state.loading)
      return _buildLoader();
    else if (state.error)
      return _buildError(context);
    else
      return ListView(
          children: state.mojangServers
              .map((s) => MojangServerCard(server: s))
              .toList(growable: false));
  }
}
