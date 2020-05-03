import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/bloc/category_bloc/category_event.dart';
import 'package:mcss/bloc/category_bloc/category_state.dart';
import 'package:mcss/domain/category.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final Logger log = Logger('MCSS.CategoryBloc');

  @override
  CategoryState get initialState => CategorySelected(Category.myServers);

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategorySelect) {
      yield* _mapSelectToState(event);
    }
  }

  Stream<CategoryState> _mapSelectToState(CategorySelect event) async* {
    yield CategorySelected(event.category);
  }
}
