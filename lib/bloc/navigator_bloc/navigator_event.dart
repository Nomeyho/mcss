import 'package:equatable/equatable.dart';

abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object> get props => [];
}

class NavigatorPop extends NavigatorEvent {}

class NavigatorPush extends NavigatorEvent {
  final String route;

  const NavigatorPush(this.route);

  @override
  List<Object> get props => [route];
}
