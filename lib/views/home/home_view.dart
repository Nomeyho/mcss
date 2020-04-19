import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_theme.dart';
import 'package:mcss/views/home/widgets/category_selector.dart';
import 'package:mcss/views/home/widgets/home_header.dart';
import 'package:mcss/views/home/widgets/home_title.dart';
import 'package:mcss/widgets/banner.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            HomeTitle(),
            HomeHeader(scrollController: scrollController),
            Banner.bottomPadding,
          ],
        ),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
