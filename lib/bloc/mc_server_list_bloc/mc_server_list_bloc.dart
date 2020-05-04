import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_event.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_state.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/services/mc_server_service.dart';
import 'package:meta/meta.dart';

class McServerListBloc extends Bloc<McServerListEvent, McServerListState> {
  final Logger log = Logger('MCSS.McServerListBloc');
  final McServerService mcServerService;

  McServerListBloc({
    @required this.mcServerService,
  });

  @override
  McServerListState get initialState => McServerListLoadInProgress();

  @override
  Stream<McServerListState> mapEventToState(McServerListEvent event) async* {
    if (event is McServerListLoad) {
      yield* _mapLoadToState();
    } else if (event is McServerListAdd) {
      yield* _mapAddToState(event);
    } else if (event is McServerListDelete) {
      yield* _mapDeleteToState(event);
    }
  }

  Stream<McServerListState> _mapLoadToState() async* {
    try {
      yield McServerListLoadInProgress();
      final servers = await mcServerService.loadServers();
      yield McServerListLoadSuccess(servers);
    } catch (_) {
      yield McServerListLoadFailure();
    }
  }

  Stream<McServerListState> _mapAddToState(McServerListAdd event) async* {
    if (state is McServerListLoadSuccess) {
      log.fine("Adding MC server: ${event.mcServer}");
      final List<McServer> servers =
          List.from((state as McServerListLoadSuccess).mcServers)
            ..add(event.mcServer);
      await mcServerService.saveServers(servers);
      yield McServerListLoadSuccess(servers);
    }
  }

  Stream<McServerListState> _mapDeleteToState(McServerListDelete event) async* {
    if (state is McServerListLoadSuccess) {
      log.fine("Removing MC server: ${event.mcServer}");
      final List<McServer> servers = (state as McServerListLoadSuccess)
          .mcServers
          .where((server) => server.id != event.mcServer.id)
          .toList(growable: false);
      await mcServerService.saveServers(servers);
      yield McServerListLoadSuccess(servers);
    }
  }
}
