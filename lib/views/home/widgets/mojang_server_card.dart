import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/mojang_server.dart';
import 'package:mcss/utils/color_utils.dart';
import 'package:mcss/widgets/server_card.dart';
import 'package:mcss/widgets/status_indicator.dart';

class MojangServerCard extends StatelessWidget {
  final MojangServer server;

  const MojangServerCard({
    Key key,
    this.server,
  }) : super(key: key);

  Widget _buildTitle() {
    return Text(
      server.name,
      style: const TextStyle(
        fontFamily: 'Lato',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.high_emphasis,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      server.url,
      style: const TextStyle(
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppTheme.medium_emphasis,
      ),
    );
  }

  Widget _buildTrailing() {
    return CustomPaint(
      size: Size(24, 16),
      painter: StatusIndicator(
        ColorUtils.getColorFromStatus(server.status),
        numberBars: 5,
        spacing: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ServerCard(
      icon: Container(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: _buildSubtitle(),
          ),
        ],
      ),
      trailing: _buildTrailing(),
    );
  }
}
