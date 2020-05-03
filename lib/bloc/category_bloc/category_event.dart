import 'package:equatable/equatable.dart';
import 'package:mcss/domain/category.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategorySelect extends CategoryEvent {
  final Category category;

  const CategorySelect(this.category);

  @override
  List<Object> get props => [category];
}
