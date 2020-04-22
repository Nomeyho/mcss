import 'package:flutter/material.dart' hide Banner;
import 'package:logging/logging.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/domain/server.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/widgets/banner.dart';
import 'package:provider/provider.dart';

class AddBottomSheet extends StatefulWidget {
  static PersistentBottomSheetController show(BuildContext context) {
    return showBottomSheet(
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
        // autofocus: true,
        onChanged: _onIpChange,
        cursorColor: AppTheme.primary,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.background,
          hintText: S.of(context).add_server_hint,
          labelText: S.of(context).add_server_ip,
          errorText: _error,
          hasFloatingPlaceholder: false,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  _onAdd() async {
    final state = Provider.of<AppState>(context, listen: false);

    if(state.servers >= 100) {
      this.setState(() {
        _error = S.of(context).error_max_100_servers;
      });
    } else {
      await state.addServer(_server);
      Navigator.pop(context);
    }
  }

  Widget _buildButton(BuildContext context) {
    return FlatButton(
      color: AppTheme.primary,
      child: Text(
        S.of(context).add_button,
        style: TextStyle(color: AppTheme.background),
      ),
      onPressed:
          (_error == null && _server != null) ? _onAdd : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      disabledTextColor: AppTheme.medium_emphasis,
      disabledColor: AppTheme.disabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 205,
      width: width,
      padding: EdgeInsets.only(
        left: 12,
        top: 24,
        right: 12,
        bottom: Banner.size.height.toDouble(),
      ),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          _buildTitle(context),
          Padding(padding: EdgeInsets.all(12)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildInput(context),
              Padding(padding: EdgeInsets.all(4)),
              _buildButton(context),
            ],
          ),
        ],
      ),
    );
  }
}
