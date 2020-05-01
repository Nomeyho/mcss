import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/base64_image.dart';
import 'package:mcss/widgets/sliver_header_delegate.dart';
import 'package:provider/provider.dart';

class DetailImage extends StatelessWidget {
  Widget _buildImage(BuildContext context) {
    final state = Provider.of<AppState>(context);
    return Hero(
      tag: state.mcServer.id.toString(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Base64Image(
          image: state.mcServerStatus.favicon,
          width: 80,
          height: 80,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverHeaderDelegate(
        child: _buildImage(context),
        minHeight: 60,
        maxHeight: 100,
        background: AppTheme.background,
      ),
      pinned: true,
      floating: false,
    );
  }
}
