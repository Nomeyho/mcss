import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/views/detail/widgets/detail_header.dart';
import 'package:mcss/views/detail/widgets/detail_title.dart';
import 'package:mcss/views/detail/widgets/ping_section.dart';
import 'package:mcss/views/detail/widgets/player_list_section.dart';
import 'package:mcss/views/detail/widgets/player_section.dart';
import 'package:mcss/views/detail/widgets/version_section.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: <Widget>[
          DetailTitle(),
          DetailHeader(),
          if (state.mcServerStatus != null)
            SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
                  PingSection(),
                  VersionSection(),
                  PlayerSection(),
                ]),
              ),
            ),
          if (state.mcServerStatus != null) PlayerListSection(),
        ]),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
