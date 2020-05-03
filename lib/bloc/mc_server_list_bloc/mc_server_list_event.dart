import 'package:equatable/equatable.dart';
import 'package:mcss/domain/mc_server.dart';

abstract class McServerListEvent extends Equatable {
  const McServerListEvent();

  @override
  List<Object> get props => [];
}

class McServerListLoad extends McServerListEvent {}

class McServerListAdd extends McServerListEvent {
  final McServer mcServer;

  const McServerListAdd(this.mcServer);

  @override
  List<Object> get props => [mcServer];
}

class McServerListDelete extends McServerListEvent {
  final McServer mcServer;

  const McServerListDelete(this.mcServer);

  @override
  List<Object> get props => [mcServer];
}
