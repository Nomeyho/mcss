import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

class SimpleBlocDelegate extends BlocDelegate {
  final Logger log = Logger('MCSS.SimpleBlocDelegate');

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log.fine('${transition.event}: ${transition.currentState} -> ${transition.nextState}');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    log.severe(error);
  }
}
