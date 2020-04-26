import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';

class McServerIndicator extends StatelessWidget {
  final int ms;

  const McServerIndicator({Key key, this.ms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ms == null) {
      return _build('', AppTheme.disabled);
    } else if (ms < 50) {
      return _build('$ms ms', AppTheme.green);
    } else if (ms < 100) {
      return _build('$ms ms', AppTheme.yellow);
    } else if (ms < 150) {
      return _build('$ms ms', AppTheme.orange);
    } else {
      return _build('$ms ms', AppTheme.red);
    }
  }

  Widget _build(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: color,
      ),
    );
  }
}
