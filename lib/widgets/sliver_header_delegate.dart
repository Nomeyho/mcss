import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
    @required this.background,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;
  final Color background;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, shrinkOffset, overlapsContent) {
    return Container(
      color: background,
      child: SizedBox.expand(child: child),
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
