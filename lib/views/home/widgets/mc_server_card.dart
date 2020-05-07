import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mc_server_card_bloc/mc_server_card_bloc.dart';
import 'package:mcss/bloc/mc_server_card_bloc/mc_server_card_event.dart';
import 'package:mcss/bloc/mc_server_card_bloc/mc_server_card_state.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_bloc.dart';
import 'package:mcss/bloc/mc_server_detail_bloc/mc_server_detail_event.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_event.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/router.dart';
import 'package:mcss/utils/color_utils.dart';
import 'package:mcss/widgets/base64_image.dart';
import 'package:mcss/widgets/error_image.dart';
import 'package:mcss/widgets/loading_image.dart';
import 'package:mcss/widgets/mc_card.dart';
import 'package:mcss/widgets/status_indicator.dart';

class McServerCard extends StatefulWidget {
  final McServer server;

  const McServerCard({
    Key key,
    this.server,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _McServerCardState();
}

class _McServerCardState extends State<McServerCard> {
  @override
  void initState() {
    BlocProvider.of<McServerCardBloc>(context)
        .add(McServerCardLoad(widget.server));
    super.initState();
  }

  Function _onPress(McServerCardState state) {
    if (state is McServerCardStateSuccess) {
      return () {
        BlocProvider.of<McServerDetailBloc>(context)
            .add(McServerDetailSelect(widget.server, state.statusResponse));
        Navigator.of(context).pushNamed(Router.detail);
      };
    } else {
      return null;
    }
  }

  void _onDismiss(_) {
    BlocProvider.of<McServerListBloc>(context)
        .add(McServerListDelete(widget.server));
  }

  Widget _buildIcon(McServerCardState state) {
    if (state is McServerCardStateLoading) {
      return LoadingImage(width: 50, height: 50);
    } else if (state is McServerCardStateSuccess) {
      return Hero(
        tag: widget.server.id.toString(),
        child: Base64Image(
          image: state.statusResponse.favicon,
          width: 50,
          height: 50,
        ),
      );
    } else if (state is McServerCardStateFailure) {
      return ErrorImage(width: 50, height: 50);
    } else {
      return Container(width: 50, height: 50);
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

  Widget _buildSubtitle(McServerCardState state) {
    String txt;
    Color color;
    if (state is McServerCardStateLoading) {
      txt = S.of(context).server_card_loading;
      color = AppTheme.medium_emphasis;
    } else if (state is McServerCardStateSuccess) {
      final players = state.statusResponse.players;
      txt = '${players.online}/${players.max} players'; // TODO
      color = AppTheme.medium_emphasis;
    } else if (state is McServerCardStateFailure) {
      txt = S.of(context).server_card_error;
      color = AppTheme.error;
    } else {
      txt = '';
      color = AppTheme.medium_emphasis;
    }

    return Text(
      txt,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: color,
      ),
    );
  }

  Widget _buildTrailing(McServerCardState state) {
    if (state is McServerCardStateSuccess) {
      return StatusIndicator(
        color: ColorUtils.getColorFromPing(state.statusResponse.ms),
        width: 24,
        height: 16,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<McServerCardBloc, McServerCardState>(
      builder: (context, state) {
        return Dismissible(
          key: Key(widget.server.id.toString()),
          onDismissed: _onDismiss,
          background: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.delete, color: AppTheme.disabled),
          ),
          child: McCard(
            onPress: _onPress(state),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: _buildIcon(state),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTitle(),
                _buildSubtitle(state),
              ],
            ),
            trailing: _buildTrailing(state),
          ),
        );
      },
    );
  }
}
