import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/bloc/navigator_bloc/navigator_event.dart';
import 'package:mcss/router.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey = Router.navigatorKey;

  @override
  dynamic get initialState => 0;

  @override
  Stream<dynamic> mapEventToState(NavigatorEvent event) async* {
    if (event is NavigatorPop) {
      navigatorKey.currentState.pop();
    } else if (event is NavigatorPush) {
      navigatorKey.currentState.pushNamed(event.route);
    }
  }
}
