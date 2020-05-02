import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mcss/widgets/error_image.dart';

class Base64Image extends StatelessWidget {
  static final log = Logger('Base64Image');

  final String image;
  final double width;
  final double height;

  const Base64Image({
    Key key,
    @required this.image,
    this.width,
    this.height,
  }) : super(key: key);

  static Uint8List _decodeImage(String dataUrl) {
    try {
      final UriData imageData = Uri.parse(dataUrl).data;
      return imageData.contentAsBytes();
    } catch (e) {
      log.severe('Failed to parse image: ${e.toString()}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bytes = _decodeImage(image);

    if (bytes == null) {
      return ErrorImage(
        width: width,
        height: height,
      );
    } else {
      return Image.memory(
        bytes,
        width: width,
        height: height,
      );
    }
  }
}
