import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_theme.dart';
import 'package:mcss/views/detail/widgets/detail_title.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            DetailTitle(),
          ],
        ),
      ),
      backgroundColor: AppTheme.background,
    );
  }
}
