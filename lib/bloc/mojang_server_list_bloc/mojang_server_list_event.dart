import 'package:equatable/equatable.dart';

abstract class MojangServerListEvent extends Equatable {
  const MojangServerListEvent();

  @override
  List<Object> get props => [];
}

class MojangServerListLoad extends MojangServerListEvent {}
