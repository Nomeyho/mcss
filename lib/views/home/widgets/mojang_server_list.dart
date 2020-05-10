import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mojang_server_list_bloc/mojang_server_list_bloc.dart';
import 'package:mcss/bloc/mojang_server_list_bloc/mojang_server_list_state.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/utils/responsive_utils.dart';
import 'package:mcss/views/home/widgets/mojang_server_card.dart';

class MojangServerList extends StatelessWidget {
  Widget _buildLoader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).server_list_error,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: AppTheme.medium_emphasis,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MojangServerListBloc, MojangServerListState>(
      builder: (context, state) {
        if (state is MojangServerListLoadInProgress) {
          return _buildLoader();
        } else if (state is MojangServerListLoadFailure) {
          return _buildError(context);
        } else if (state is MojangServerListLoadSuccess) {
          if (ResponsiveUtils.isTablet(context)) {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 5,
              children: state.mojangServers
                  .map((s) => MojangServerCard(server: s))
                  .toList(growable: false),
            );
          } else {
            return ListView(
              children: state.mojangServers
                  .map((s) => MojangServerCard(server: s))
                  .toList(growable: false),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
