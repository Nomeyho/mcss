import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/fade_in.dart';

class McCard extends StatelessWidget {
  final Widget icon;
  final Widget content;
  final Widget trailing;
  final Function onPress;

  const McCard(
      {Key key,
      @required this.icon,
      @required this.content,
      @required this.trailing,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: 700),
      child: Card(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        color: AppTheme.medium_black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: onPress,
          highlightColor: AppTheme.highlight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                icon,
                Padding(padding: EdgeInsets.only(right: 8)),
                Expanded(child: content),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
