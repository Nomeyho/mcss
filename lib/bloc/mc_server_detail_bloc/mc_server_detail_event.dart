import 'package:dart_mc_ping/model/status_response.dart';
import 'package:equatable/equatable.dart';
import 'package:mcss/domain/mc_server.dart';

abstract class McServerDetailEvent extends Equatable {
  const McServerDetailEvent();

  @override
  List<Object> get props => [];
}

class McServerDetailSelect extends McServerDetailEvent {
  final McServer mcServer;
  final StatusResponse statusResponse;

  const McServerDetailSelect(this.mcServer, this.statusResponse);

  @override
  List<Object> get props => [mcServer];
}
