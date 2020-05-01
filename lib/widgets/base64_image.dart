import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

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
      log.severe('Failed to parse image: $e');
      return Uint8List(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      _decodeImage(image),
      width: width,
      height: height,
    );
  }
}
