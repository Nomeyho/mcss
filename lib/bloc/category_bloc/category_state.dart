import 'package:equatable/equatable.dart';
import 'package:mcss/domain/category.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategorySelected extends CategoryState {
  final Category category;

  const CategorySelected(
    this.category,
  );

  @override
  List<Object> get props => [category];
}
