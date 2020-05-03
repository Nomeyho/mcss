import 'package:equatable/equatable.dart';
import 'package:mcss/domain/mojang_server.dart';

abstract class MojangServerListState extends Equatable {
  const MojangServerListState();

  @override
  List<Object> get props => [];
}

class MojangServerListLoadInProgress extends MojangServerListState {}

class MojangServerListLoadSuccess extends MojangServerListState {
  final List<MojangServer> mojangServers;

  const MojangServerListLoadSuccess([
    this.mojangServers = const [],
  ]);

  @override
  List<Object> get props => [mojangServers];
}

class MojangServerListLoadFailure extends MojangServerListState {}
