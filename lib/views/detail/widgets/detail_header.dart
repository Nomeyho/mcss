import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_bloc.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_state.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:mcss/widgets/sliver_header_delegate.dart';

class DetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverHeaderDelegate(
        child: BlocBuilder<McServerDetailBloc, McServerDetailState>(
          builder: (context, _state) {
            final state = _state as McServerSelected;
            return ChatObjectText(
              rootChatObject: state.statusResponse.description,
              fontSize: 14,
            );
          },
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
