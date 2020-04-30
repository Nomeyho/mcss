import 'dart:typed_data';

import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/router.dart';
import 'package:mcss/widgets/server_card.dart';
import 'package:mcss/widgets/status_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class McServerCard extends StatefulWidget {
  final McServer server;

  const McServerCard({
    Key key,
    this.server,
  }) : super(key: key);

  @override
  _McServerCardState createState() => _McServerCardState();
}

class _McServerCardState extends State<McServerCard> {
  Future<StatusResponse> _status;

  @override
  void initState() {
    final state = Provider.of<AppState>(context, listen: false);
    _status = state.pingMcServer(widget.server);
    super.initState();
  }

  static Uint8List _decodeImage(String imageStr) {
    final UriData imageData = Uri.parse(imageStr).data;
    return imageData.contentAsBytes();
  }

  void _onPress() {
    final state = Provider.of<AppState>(context, listen: false);
    state.selectMcServer(widget.server, _status);
    Navigator.of(context).pushNamed(Router.detail);
  }

  Widget _buildIcon(AsyncSnapshot<StatusResponse> snapshot) {
    if (snapshot.hasError) {
      return Container(
        width: 60,
        height: 60,
        color: AppTheme.disabled.withOpacity(0.1),
      );
    } else if (!snapshot.hasData) {
      return Shimmer.fromColors(
        baseColor: AppTheme.disabled.withOpacity(0.3),
        highlightColor: AppTheme.disabled.withOpacity(0.5),
        enabled: !snapshot.hasError,
        child: Container(
          width: 60,
          height: 60,
          color: AppTheme.disabled,
        ),
      );
    } else {
      return Image.memory(
        _decodeImage(snapshot.data.favicon),
        height: 60,
        width: 60,
      );
    }
  }

  Widget _buildTitle() {
    return Text(
      widget.server.toDisplayString(),
      style: const TextStyle(
        fontFamily: 'Lato',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.high_emphasis,
      ),
    );
  }

  Widget _buildSubtitle(AsyncSnapshot<StatusResponse> snapshot) {
    if (snapshot.hasError) {
      return Text(
        S.of(context).server_card_error,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppTheme.error,
        ),
      );
    } else if (!snapshot.hasData) {
      return Text(
        S.of(context).server_card_loading,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppTheme.medium_emphasis,
        ),
      );
    } else {
      return Text(
        '${snapshot.data.players.online} / ${snapshot.data.players.max} players',
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppTheme.medium_emphasis,
        ),
      );
    }
  }

  Widget _buildTrailing(AsyncSnapshot<StatusResponse> snapshot) {
    return CustomPaint(
      size: Size(24, 16),
      painter: StatusIndicator(
        snapshot.hasData ? snapshot.data.ms : null,
        numberBars: 5,
        spacing: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _status,
      builder: (context, AsyncSnapshot<StatusResponse> snapshot) {
        return ServerCard(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Hero(
              tag: widget.server.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: _buildIcon(snapshot),
              ),
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle(),
              _buildSubtitle(snapshot),
            ],
          ),
          trailing: _buildTrailing(snapshot),
        );
      },
    );
  }
}
