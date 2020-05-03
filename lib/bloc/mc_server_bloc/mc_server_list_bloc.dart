import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_list_event.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_state.dart';

class McServerBloc extends Bloc<McServerEvent, McServerState> {
  final Logger log = Logger('MCSS.McServerBloc');

  @override
  McServerState get initialState => McServerNotSelected();

  @override
  Stream<McServerState> mapEventToState(McServerEvent event) async* {
    if (event is McServerSelect) {
      yield* _mapSelectToState(event);
    }
  }

  Stream<McServerState> _mapSelectToState(McServerSelect event) async* {
    yield McServerSelected(event.mcServer, event.statusResponse);
  }
}
