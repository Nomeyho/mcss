import 'package:dart_mc_ping/model/status_response.dart';
import 'package:equatable/equatable.dart';
import 'package:mcss/domain/mc_server.dart';

abstract class McServerEvent extends Equatable {
  const McServerEvent();

  @override
  List<Object> get props => [];
}

class McServerSelect extends McServerEvent {
  final McServer mcServer;
  final StatusResponse statusResponse;

  const McServerSelect(this.mcServer, this.statusResponse);

  @override
  List<Object> get props => [mcServer];
}
