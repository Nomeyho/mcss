import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/bloc/category_bloc/category_event.dart';
import 'package:mcss/domain/category.dart';

class CategoryBloc extends Bloc<CategoryEvent, Category> {
  final Logger log = Logger('MCSS.CategoryBloc');

  @override
  Category get initialState => Category.myServers;

  @override
  Stream<Category> mapEventToState(CategoryEvent event) async* {
    if (event is CategorySelect) {
      yield* _mapSelectToState(event);
    }
  }

  Stream<Category> _mapSelectToState(CategorySelect event) async* {
    yield event.category;
  }
}
