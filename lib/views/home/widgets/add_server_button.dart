import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/category_bloc/category_bloc.dart';
import 'package:mcss/bloc/mojang_server_list_bloc/mojang_server_list_bloc.dart';
import 'package:mcss/bloc/mojang_server_list_bloc/mojang_server_list_state.dart';
import 'package:mcss/domain/category.dart';
import 'package:mcss/views/add_server/add_server_modal.dart';

class AddServerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MojangServerListBloc, MojangServerListState>(
      builder: (context, state) {
        return BlocBuilder<CategoryBloc, Category>(
            builder: (context, category) {
          if (state is MojangServerListLoadSuccess &&
              category == Category.mcServers) {
            return IconButton(
              icon: Icon(Icons.add, color: AppTheme.primary),
              onPressed: () => AddServerModal.show(context),
            );
          } else {
            return Container();
          }
        });
      },
    );
  }
}
