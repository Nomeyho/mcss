import 'package:equatable/equatable.dart';
import 'package:mcss/domain/mc_server.dart';

abstract class McServerListState extends Equatable {
  const McServerListState();

  @override
  List<Object> get props => [];
}

class McServerListLoadInProgress extends McServerListState {}

class McServerListLoadSuccess extends McServerListState {
  final List<McServer> mcServers;

  const McServerListLoadSuccess([
    this.mcServers = const [],
  ]);

  @override
  List<Object> get props => [mcServers];
}

class McServerListLoadFailure extends McServerListState {}
