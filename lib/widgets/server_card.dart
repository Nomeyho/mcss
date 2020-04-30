import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/fade_in.dart';

class ServerCard extends StatelessWidget {
  final Widget icon;
  final Widget content;
  final Widget trailing;

  const ServerCard({
    Key key,
    this.icon,
    this.content,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: 700),
      child: Card(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        color: AppTheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              icon,
              Expanded(child: content),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
