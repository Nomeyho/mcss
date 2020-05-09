import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/views/add/add_bottom_sheet.dart';
import 'package:mcss/views/home/widgets/category_selector.dart';

class HomeTitle extends StatelessWidget {
  final ScrollController scrollController;

  const HomeTitle({
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.background,
      expandedHeight: 100,
      automaticallyImplyLeading: false,
      title: Text(
        S.of(context).home_title,
        style: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: AppTheme.high_emphasis,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 24, bottom: 18),
        title: CategorySelector(scrollController: scrollController),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add, color: AppTheme.high_emphasis),
          // TODO should only be visible/enabled if state is loaded?
          onPressed: () => AddBottomSheet.show(context),
        ),
      ],
      pinned: true,
      floating: true,
      snap: false,
      elevation: 0,
    );
  }
}
