import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/views/add/add_bottom_sheet.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.background,
      expandedHeight: 100,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 24, bottom: 16),
        title: Text(
          S.of(context).home_title,
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: AppTheme.high_emphasis,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          // TODO should only be visible/enabled if state is loaded?
          onPressed: () => AddBottomSheet.show(context),
        ),
      ],
      pinned: true,
      floating: false,
      elevation: 0,
    );
  }
}
