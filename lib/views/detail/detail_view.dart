import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_theme.dart';
import 'package:mcss/views/detail/widgets/detail_title.dart';
import 'package:mcss/views/detail/widgets/motd_section.dart';
import 'package:mcss/views/detail/widgets/ping_section.dart';
import 'package:mcss/views/detail/widgets/player_section.dart';
import 'package:mcss/views/detail/widgets/version_section.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: <Widget>[
          DetailTitle(),
          SliverPadding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                PingSection(),
                MotdSection(),
                VersionSection(),
                PlayerSection(),
              ]),
            ),
          ),
        ]),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
