import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/widgets/base64_image.dart';
import 'package:provider/provider.dart';

class DetailTitle extends StatelessWidget {
  Widget _buildImage(McServer mcServer, StatusResponse mcServerStatus) {
    return Hero(
      tag: mcServer.id.toString(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Base64Image(
          image: mcServerStatus.favicon,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildText(McServer server) {
    String displayStr = server.toDisplayString();
    if(displayStr.length > 23) {
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
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return SliverAppBar(
      backgroundColor: AppTheme.background,
      expandedHeight: 100,
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildImage(state.mcServer, state.mcServerStatus),
            Padding(padding: EdgeInsets.all(3)),
            _buildText(state.mcServer),
          ],
        ),
      ),
      pinned: true,
      floating: false,
      elevation: 0,
    );
  }
}
