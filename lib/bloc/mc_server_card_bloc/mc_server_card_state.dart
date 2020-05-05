import 'package:dart_mc_ping/model/status_response.dart';
import 'package:equatable/equatable.dart';

abstract class McServerCardState extends Equatable {
  const McServerCardState();

  @override
  List<Object> get props => [];
}

class McServerCardStateLoading extends McServerCardState {
  const McServerCardStateLoading();

  @override
  List<Object> get props => [];
}

class McServerCardStateSuccess extends McServerCardState {
  final StatusResponse statusResponse;

  const McServerCardStateSuccess(
    this.statusResponse,
  );

  @override
  List<Object> get props => [statusResponse];
}

class McServerCardStateFailure extends McServerCardState {
  const McServerCardStateFailure();

  @override
  List<Object> get props => [];
}
