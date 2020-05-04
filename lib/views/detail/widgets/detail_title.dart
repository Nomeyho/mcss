import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mc_server_bloc/mc_server_state.dart';
import 'package:mcss/widgets/base64_image.dart';

class DetailTitle extends StatelessWidget {
  Widget _buildImage() {
    return BlocBuilder<McServerBloc, McServerState>(
      builder: (context, state) {
        if (state is McServerSelected) {
          return Hero(
            tag: state.mcServer.id.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Base64Image(
                image: state.statusResponse.favicon,
                width: 24,
                height: 24,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildText() {
    return BlocBuilder<McServerBloc, McServerState>(
      builder: (context, state) {
        if (state is McServerSelected) {
          String displayStr = state.mcServer.toDisplayString();
          if (displayStr.length > 23) {
            displayStr = displayStr.substring(0, 20) + '...';
          }

          return Text(
            displayStr,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppTheme.high_emphasis,
            ),
          );
        } else {
          return SliverToBoxAdapter();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.background,
      expandedHeight: 100,
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildImage(),
            Padding(padding: EdgeInsets.all(3)),
            _buildText(),
          ],
        ),
      ),
      pinned: true,
      floating: false,
      elevation: 0,
    );
  }
}
