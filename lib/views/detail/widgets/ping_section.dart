import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_state.dart';
import 'package:mcss/widgets/section_header.dart';

class PingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<McServerBloc, McServerState>(
      builder: (context, state) {
        if (state is McServerSelected) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: SectionHeader(
              title: 'Ping: ',
              subtitle: '${state.statusResponse.ms} ms',
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
