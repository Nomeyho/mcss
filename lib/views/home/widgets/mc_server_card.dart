import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/router.dart';
import 'package:mcss/utils/color_utils.dart';
import 'package:mcss/widgets/base64_image.dart';
import 'package:mcss/widgets/error_image.dart';
import 'package:mcss/widgets/loading_image.dart';
import 'package:mcss/widgets/mc_card.dart';
import 'package:mcss/widgets/status_indicator.dart';
import 'package:provider/provider.dart';

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
  static final NumberFormat f = NumberFormat('#,###,###');

  StatusResponse _status;
  bool _error = false;
  bool _loading = true;

  @override
  void initState() {
    final state = Provider.of<AppState>(context, listen: false);
    state.pingMcServer(widget.server).then((status) {
      setState(() {
        _status = status;
        _error = false;
        _loading = false;
      });
    }).catchError((e) {
      setState(() {
        _error = true;
        _loading = false;
      });
    });
    super.initState();
  }

  void _onPress() {
    Provider.of<AppState>(context, listen: false)
        .selectMcServer(widget.server, _status);
    Navigator.of(context).pushNamed(Router.detail);
  }

  Widget _buildIcon() {
    Widget icon;

    if (_loading) {
      icon = LoadingImage(width: 50, height: 50);
    } else if (_error) {
      icon = ErrorImage(width: 50, height: 50);
    } else {
      icon = Hero(
        tag: widget.server.id.toString(),
        child: Base64Image(
          image: _status?.favicon,
          width: 50,
          height: 50,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: icon,
    );
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

  Widget _buildSubtitle() {
    String txt;
    if (_error) {
      txt = S.of(context).server_card_error;
    } else if (_loading) {
      txt = S.of(context).server_card_loading;
    } else {
      txt = '${_status.players.online}/${_status.players.max} players';
    }

    return Text(
      txt,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: _error ? AppTheme.error : AppTheme.medium_emphasis,
      ),
    );
  }

  Widget _buildTrailing() {
    return StatusIndicator(
      color: ColorUtils.getColorFromPing(_status?.ms),
      width: 24,
      height: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return McCard(
      onPress: (_status != null) ? _onPress : null,
      icon: _buildIcon(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          _buildSubtitle(),
        ],
      ),
      trailing: _buildTrailing(),
    );
  }
}
