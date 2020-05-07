import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mc_server_card_bloc/mc_server_card_bloc.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_state.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/services/mc_server_service.dart';
import 'package:mcss/views/home/widgets/mc_server_card.dart';
import 'package:provider/provider.dart';

class McServerList extends StatelessWidget {
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

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).server_list_empty,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: AppTheme.medium_emphasis,
        ),
      ),
    );
  }

  Widget _buildServerCard(McServer mcServer) {
    return BlocProvider(
      /// Preserve state upon deleting to avoid useless reloading
      key: ValueKey(mcServer.id),
      create: (context) {
        return McServerCardBloc(
          mcServerService: Provider.of<McServerService>(context, listen: false),
        );
      },
      child: McServerCard(server: mcServer),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<McServerListBloc, McServerListState>(
      builder: (context, state) {
        if (state is McServerListLoadInProgress) {
          return _buildLoader();
        } else if (state is McServerListLoadFailure) {
          return _buildError(context);
        } else if (state is McServerListLoadSuccess) {
          if (state.mcServers.isEmpty) {
            return _buildEmpty(context);
          } else {
            return ListView(
              children: state.mcServers
                  .map((s) => _buildServerCard(s))
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
