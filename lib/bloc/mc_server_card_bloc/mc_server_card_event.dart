import 'package:equatable/equatable.dart';
import 'package:mcss/domain/mc_server.dart';

abstract class McServerCardEvent extends Equatable {
  const McServerCardEvent();

  @override
  List<Object> get props => [];
}

class McServerCardLoad extends McServerCardEvent {
  final McServer mcServer;

  const McServerCardLoad(this.mcServer);

  @override
  List<Object> get props => [mcServer];
}
