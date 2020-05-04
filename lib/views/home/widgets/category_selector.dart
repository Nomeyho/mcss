import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/category_bloc/category_bloc.dart';
import 'package:mcss/bloc/category_bloc/category_event.dart';
import 'package:mcss/domain/category.dart';

class CategorySelector extends StatelessWidget {
  final ScrollController scrollController;

  const CategorySelector({
    Key key,
    this.scrollController,
  }) : super(key: key);

  Widget buildChip(BuildContext context, Category category) {
    return BlocBuilder<CategoryBloc, Category>(
      builder: (context, selectedCategory) {
        final selected = category == selectedCategory;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: ChoiceChip(
            pressElevation: 0,
            label: Text(
              category.translate(context),
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 16,
                color: selected ? AppTheme.background : AppTheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onSelected: (_) {
              BlocProvider.of<CategoryBloc>(context)
                  .add(CategorySelect(category));
              scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            },
            // fix chip border issue
            shape: const StadiumBorder(
              side: const BorderSide(
                color: AppTheme.background,
                width: 0,
                style: BorderStyle.solid,
              ),
            ),
            selected: selected,
            selectedColor: AppTheme.primary,
            backgroundColor: AppTheme.background,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Category.values
                .map((c) => buildChip(context, c))
                .toList(growable: false)),
      ),
    );
  }
}
