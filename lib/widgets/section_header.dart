import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeader({
    Key key,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppTheme.high_emphasis,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: TextStyle(
              color: AppTheme.medium_emphasis,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
