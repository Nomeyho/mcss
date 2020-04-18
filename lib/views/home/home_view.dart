import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/banner.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            Text('test'),
            Banner(),
          ],
        ),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
