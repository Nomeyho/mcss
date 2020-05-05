import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:mcss/bloc/mc_server_card_bloc/mc_server_card_event.dart';
import 'package:mcss/bloc/mc_server_card_bloc/mc_server_card_state.dart';
import 'package:mcss/services/mc_server_service.dart';

class McServerCardBloc extends Bloc<McServerCardEvent, McServerCardState> {
  final Logger log = Logger('MCSS.McServerCardBloc');
  final McServerService mcServerService;

  McServerCardBloc({
    @required this.mcServerService,
  });

  @override
  McServerCardState get initialState => McServerCardStateLoading();

  @override
  Stream<McServerCardState> mapEventToState(McServerCardEvent event) async* {
    if (event is McServerCardLoad) {
      yield* _mapLoadToState(event);
    }
  }

  Stream<McServerCardState> _mapLoadToState(McServerCardLoad event) async* {
    try {
      yield McServerCardStateLoading();
      final status = await mcServerService.ping(event.mcServer);
      yield McServerCardStateSuccess(status);
    } catch (e) {
      yield McServerCardStateFailure();
    }

    yield McServerCardStateLoading();
  }
}
