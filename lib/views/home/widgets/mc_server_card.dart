import 'dart:typed_data';

import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/router.dart';
import 'package:mcss/views/home/widgets/mc_server_indicator.dart';
import 'package:mcss/widgets/fade_in.dart';
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
    state.selectMcServer(widget.server);
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
        '${snapshot.data.players.online} / ${snapshot.data.players.max}',
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppTheme.medium_emphasis,
        ),
      );
    }
  }

  Widget _buildContent(AsyncSnapshot<StatusResponse> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Center(
          child: RichText(
            text: _toText(snapshot.data.description),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  TextSpan _toText(ChatObject chatObject) {
    return TextSpan(
      text: chatObject.text,
      style: TextStyle(
        color: chatObject.color == null ? null : Color(chatObject.color.hex),
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: (chatObject.bold != null && chatObject.bold == true)
            ? FontWeight.w700
            : FontWeight.w400,
        fontStyle: (chatObject.italic != null && chatObject.italic == true)
            ? FontStyle.italic
            : FontStyle.normal,
        decoration: TextDecoration.combine([
          (chatObject.underlined != null && chatObject.underlined == true)
              ? TextDecoration.underline
              : TextDecoration.none,
          (chatObject.strikethrough != null && chatObject.strikethrough == true)
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ]),
      ),
      children: chatObject.extra
          .map((extra) => _toText(extra))
          .toList(growable: false),
    );
  }

  Widget _buildTrailing(AsyncSnapshot<StatusResponse> snapshot) {
    return McServerIndicator(ms: snapshot.hasData ? snapshot.data.ms : null);
  }

  // _buildTrailing(snapshot) // TODO

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _status,
      builder: (context, AsyncSnapshot<StatusResponse> snapshot) {
        return FadeIn(
          duration: Duration(milliseconds: 700),
          child: Card(
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            color: AppTheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: _onPress,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Hero(
                            tag: widget.server.id.toString(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: _buildIcon(snapshot),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildTitle(),
                              _buildSubtitle(snapshot),
                            ],
                          ),
                        ),
                        _buildTrailing(snapshot),
                      ],
                    ),
                    _buildContent(snapshot),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
