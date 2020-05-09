import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/views/home/widgets/add_server_button.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.background,
      expandedHeight: 100,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16, bottom: 18),
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
        AddServerButton(),
      ],
      pinned: true,
      floating: true,
      snap: false,
      elevation: 0,
    );
  }
}
