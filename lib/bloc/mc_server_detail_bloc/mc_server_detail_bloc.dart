import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_event.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_state.dart';

class McServerDetailBloc extends Bloc<McServerDetailEvent, McServerDetailState> {
  final Logger log = Logger('MCSS.McServerBloc');

  @override
  McServerDetailState get initialState => McServerNotSelected();

  @override
  Stream<McServerDetailState> mapEventToState(McServerDetailEvent event) async* {
    if (event is McServerDetailSelect) {
      yield* _mapSelectToState(event);
    }
  }

  Stream<McServerDetailState> _mapSelectToState(McServerDetailSelect event) async* {
    yield McServerSelected(event.mcServer, event.statusResponse);
  }
}
