import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/views/home/widgets/add_floating_button.dart';
import 'package:mcss/views/home/widgets/home_header.dart';
import 'package:mcss/views/home/widgets/home_title.dart';
import 'package:mcss/views/home/widgets/server_list.dart';
import 'package:mcss/widgets/banner.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();

  @override
  void didUpdateWidget(Widget oldWidget) {
    Provider.of<AppState>(context).loadServers();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddFloatingButton(),
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            HomeTitle(),
            HomeHeader(scrollController: scrollController),
            ServerList(),
            Banner.bottomPadding,
          ],
        ),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
