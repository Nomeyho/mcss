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

  Widget buildChip(Category category) {
    return BlocBuilder<CategoryBloc, Category>(
      builder: (context, selectedCategory) {
        final selected = category == selectedCategory;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<CategoryBloc>(context)
                  .add(CategorySelect(category));
              scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                bottom: 5,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: selected ? AppTheme.primary : AppTheme.background,
                    width: 2,
                  ),
                ),
              ),
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 300),
                style: selected
                    ? TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: AppTheme.high_emphasis,
                        fontWeight: FontWeight.w700,
                      )
                    : TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        color: AppTheme.medium_emphasis,
                        fontWeight: FontWeight.w400,
                      ),
                child: Text(category.translate(context)),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppTheme.background),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
              children: Category.values
                  .map((c) => buildChip(c))
                  .toList(growable: false)),
        ),
      ),
    );
  }
}
