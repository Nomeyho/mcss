import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/category_bloc/category_bloc.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/views/home/widgets/home_header.dart';
import 'package:mcss/views/home/widgets/home_title.dart';
import 'package:mcss/views/home/widgets/mc_server_list.dart';
import 'package:mcss/views/home/widgets/mojang_server_list.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();

  Widget _buildServerList() {
    return BlocBuilder<CategoryBloc, Category>(
      builder: (context, category) {
        switch (category) {
          case Category.mcServers:
            return McServerList();
          case Category.mojangServers:
            return MojangServerList();
            break;
          default:
            throw Exception('Unexpected category $category');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool _) {
            return [
              HomeTitle(scrollController: scrollController),
              // HomeHeader(scrollController: scrollController),
            ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _buildServerList(),
          ),
        ),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
