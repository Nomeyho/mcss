import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:mcss/widgets/sliver_header_delegate.dart';
import 'package:provider/provider.dart';

class DetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return SliverPersistentHeader(
      delegate: SliverHeaderDelegate(
        child: ChatObjectText(
          rootChatObject: state.mcServerStatus.description,
          fontSize: 14,
        ),
        minHeight: 40,
        maxHeight: 60,
        background: AppTheme.background,
      ),
      pinned: true,
      floating: false,
    );
  }
}
