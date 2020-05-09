import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/sliver_header_delegate.dart';

import 'category_selector.dart';

class HomeHeader extends StatelessWidget {
  final ScrollController scrollController;

  const HomeHeader({
    Key key,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverHeaderDelegate(
        child: CategorySelector(scrollController: scrollController),
        minHeight: 60,
        maxHeight: 60,
        background: AppTheme.background,
      ),
      pinned: true,
      floating: false,
    );
  }
}
