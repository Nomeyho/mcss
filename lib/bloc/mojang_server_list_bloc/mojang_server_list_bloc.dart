import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/bloc/mojang_server_list_bloc/mojang_server_list_event.dart';
import 'package:mcss/bloc/mojang_server_list_bloc/mojang_server_list_state.dart';
import 'package:mcss/services/mojang_server_service.dart';
import 'package:meta/meta.dart';

class MojangServerListBloc
    extends Bloc<MojangServerListEvent, MojangServerListState> {
  final Logger log = Logger('MCSS.MojangServerListBloc');
  final MojangServerService mojangServerService;

  MojangServerListBloc({@required this.mojangServerService});

  @override
  MojangServerListState get initialState => MojangServerListLoadInProgress();

  @override
  Stream<MojangServerListState> mapEventToState(
      MojangServerListEvent event) async* {
    if (event is MojangServerListLoad) {
      yield* _mapLoadToState();
    }
  }

  Stream<MojangServerListState> _mapLoadToState() async* {
    try {
      yield MojangServerListLoadInProgress();
      final servers = await mojangServerService.loadServers();
      yield MojangServerListLoadSuccess(servers);
    } catch (_) {
      yield MojangServerListLoadFailure();
    }
  }
}
