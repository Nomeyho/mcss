import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/generated/i18n.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.background,
      expandedHeight: 100,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // TODO
          },
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          S.of(context).home_title,
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppTheme.high_emphasis,
          ),
        ),
      ),
      pinned: true,
      floating: false,
      elevation: 0,
    );
  }
}