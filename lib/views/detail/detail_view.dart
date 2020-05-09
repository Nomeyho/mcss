import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_theme.dart';
import 'package:mcss/views/detail/widgets/detail_header.dart';
import 'package:mcss/views/detail/widgets/detail_title.dart';
import 'package:mcss/views/detail/widgets/ping_section.dart';
import 'package:mcss/views/detail/widgets/player_list_section.dart';
import 'package:mcss/views/detail/widgets/player_section.dart';
import 'package:mcss/views/detail/widgets/version_section.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: <Widget>[
          DetailTitle(),
          DetailHeader(),
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
          PlayerListSection(),
        ]),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
