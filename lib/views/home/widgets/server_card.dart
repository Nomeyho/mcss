import 'package:flutter/material.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/server.dart';
import 'package:mcss/widgets/fade_in.dart';

class ServerCard extends StatelessWidget {
  final Server server;

  const ServerCard({
    Key key,
    this.server,
  }) : super(key: key);

  Widget _buildIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Hero(
        tag: server.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'assets/images/dirt.jpg',
            height: 60,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      '${server.hostname} ${server.hasDefaultPort ? '' : ':${server.port}'}',
      style: const TextStyle(
        fontFamily: 'Lato',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.high_emphasis,
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        'TODO',
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppTheme.medium_emphasis,
        ),
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    return Container(
      child: Text(
        'TODO',
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppTheme.disabled,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          onTap: () {
            // TODO
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildIcon(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTitle(context),
                      _buildSubtitle(context),
                    ],
                  ),
                ),
                _buildTrailing(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
