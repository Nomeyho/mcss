import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_bloc.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_state.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/widgets/section_header.dart';

class PingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<McServerDetailBloc, McServerDetailState>(
      builder: (context, _state) {
        final state = _state as McServerSelected;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: SectionHeader(
            title: S.of(context).ping_title,
            subtitle: '${state.statusResponse.ms} ms',
          ),
        );
      },
    );
  }
}
