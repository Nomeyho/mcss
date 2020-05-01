import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:provider/provider.dart';

class DetailTitle extends StatelessWidget {
  Widget _buildText(McServer server) {
    return Text(
      server.toDisplayString(),
      style: TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: AppTheme.high_emphasis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return SliverAppBar(
      backgroundColor: AppTheme.background,
      expandedHeight: 100,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: _buildText(state.mcServer),
      ),
      pinned: true,
      floating: false,
      elevation: 0,
    );
  }
}
