import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/views/home/widgets/home_header.dart';
import 'package:mcss/views/home/widgets/home_title.dart';
import 'package:mcss/views/home/widgets/server_card.dart';
import 'package:mcss/widgets/banner.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final servers = Provider.of<AppState>(context).servers;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            HomeTitle(),
            HomeHeader(scrollController: scrollController),
            SliverPadding(
              padding: EdgeInsets.all(12),
              sliver: Container(
                child: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => ServerCard(server: servers[index]),
                    childCount: servers.length,
                  ),
                ),
              ),
            ),
            Banner.bottomPadding,
          ],
        ),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
