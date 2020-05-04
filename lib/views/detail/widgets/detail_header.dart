import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_state.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:mcss/widgets/sliver_header_delegate.dart';

class DetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: SliverHeaderDelegate(
        child: BlocBuilder<McServerBloc, McServerState>(
          builder: (context, state) {
            if (state is McServerSelected) {
              return ChatObjectText(
                rootChatObject: state.statusResponse.description,
                fontSize: 14,
              );
            } else {
              return Container();
            }
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
