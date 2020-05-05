import 'package:dart_mc_ping/model/status_response.dart';
import 'package:equatable/equatable.dart';
import 'package:mcss/domain/mc_server.dart';

abstract class McServerDetailState extends Equatable {
  const McServerDetailState();

  @override
  List<Object> get props => [];
}

class McServerNotSelected extends McServerDetailState {}

class McServerSelected extends McServerDetailState {
  final McServer mcServer;
  final StatusResponse statusResponse;

  const McServerSelected(
    this.mcServer,
    this.statusResponse,
  );

  @override
  List<Object> get props => [mcServer, statusResponse];
}
