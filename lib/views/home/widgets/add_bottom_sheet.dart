import 'package:flutter/material.dart' hide Banner;
import 'package:logging/logging.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/server.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/widgets/banner.dart';
import 'package:provider/provider.dart';

class AddBottomSheet extends StatefulWidget {
  static show(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (_) => AddBottomSheet(),
    );
  }

  @override
  _AddBottomSheetState createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final Logger log = Logger('AddBottomSheet');

  Server _server;
  String _error;

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).add_title,
      style: TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: AppTheme.high_emphasis,
      ),
    );
  }

  _onIpChange(value) {
    Server server;
    String error;

    try {
      server = Server.parse(value);
    } on EmptyHostnameException {
      error = S.of(context).error_empty_ip;
    } on InvalidPortNumberException {
      error = S.of(context).error_invalid_port;
    } on NegativePortNumberException {
      error = S.of(context).error_negative_port;
    } on TooLargePortNumberException {
      error = S.of(context).error_too_large_port;
    }

    setState(() {
      _server = server;
      _error = error;
    });
  }

  Widget _buildInput(BuildContext context) {
    return Expanded(
      child: TextFormField(
        autofocus: true,
        onChanged: _onIpChange,
        cursorColor: AppTheme.primary,
        decoration: InputDecoration(
          hintText: S.of(context).add_server_hint,
          labelText: S.of(context).add_server_ip,
          errorText: _error,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: _error == null
          ? () async {
              Provider.of<AppState>(context, listen: false).addServer(_server);
            }
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: AppTheme.surface,
      height: 200,
      width: width,
      padding: EdgeInsets.only(
        left: 12,
        top: 24,
        right: 12,
        bottom: Banner.size.height.toDouble(),
      ),
      child: Column(
        children: <Widget>[
          _buildTitle(context),
          Row(
            children: <Widget>[
              _buildInput(context),
              _buildButton(context),
            ],
          ),
        ],
      ),
    );
  }
}
