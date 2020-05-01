import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class Base64Image extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final bool loading;
  final bool error;

  const Base64Image({
    Key key,
    @required this.image,
    this.width,
    this.height,
    this.loading = false,
    this.error = false,
  }) : super(key: key);

  static Uint8List _decodeImage(String dataUrl) {
    final UriData imageData = Uri.parse(dataUrl).data;
    return imageData.contentAsBytes();
  }

  Widget _buildImage() {
    return Image.memory(
      _decodeImage(image),
      width: width,
      height: height,
    );
  }

  Widget _buildErrorImage() {
    return Container(
      width: width,
      height: height,
      color: AppTheme.disabled.withOpacity(0.1),
    );
  }

  Widget _buildLoadingImage() {
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

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return _buildLoadingImage();
    } else if (error) {
      return _buildErrorImage();
    } else {
      return _buildImage();
    }
  }
}
