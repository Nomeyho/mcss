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

  /// TODO: the automatic FadeIn is not ideal with the BLoC pattern
  /// 'cause we don't control when Widget are rebuilt (immutable).
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
