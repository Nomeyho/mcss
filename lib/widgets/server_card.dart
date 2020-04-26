import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/fade_in.dart';

class ServerCard extends StatelessWidget {
  final String iconTag;
  final Widget icon;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final Function onPress;

  const ServerCard({
    Key key,
    @required this.iconTag,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    @required this.trailing,
    this.onPress,
  }) : super(key: key);

  Widget _buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Hero(
        tag: iconTag,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: icon,
        ),
      ),
    );
  }

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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildIcon(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      title,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: subtitle,
                      ),
                    ],
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
