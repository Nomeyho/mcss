import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class LoadingImage extends StatelessWidget {
  final double width;
  final double height;

  const LoadingImage({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.disabled.withOpacity(0.3),
      highlightColor: AppTheme.disabled.withOpacity(0.5),
      child: Container(
        width: width,
        height: height,
        color: AppTheme.disabled,
      ),
    );
  }
}
