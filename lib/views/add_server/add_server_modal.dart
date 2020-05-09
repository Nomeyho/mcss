import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_event.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_state.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/generated/i18n.dart';

class AddServerModal extends StatefulWidget {
  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AddServerModal();
      },
    );
  }

  @override
  _AddServerModalState createState() => _AddServerModalState();
}

class _AddServerModalState extends State<AddServerModal> {
  final Logger log = Logger('MCSS.AddServerModal');

  McServer _server;
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
    McServer server;
    String error;

    try {
      server = McServer.parse(value);
    } on EmptyHostnameException {
      error = S.of(context).error_empty_ip;
    } on InvalidPortNumberException {
      error = S.of(context).error_invalid_port;
    } on NegativePortNumberException {
      error = S.of(context).error_negative_port;
    } on TooLargePortNumberException {
      error = S.of(context).error_too_large_port;
    }

    final state = BlocProvider.of<McServerListBloc>(context).state
        as McServerListLoadSuccess;
    if (state.hasServer(server)) {
      error = S.of(context).error_already_exist;
    }

    setState(() {
      _server = server;
      _error = error;
    });
  }

  Widget _buildInput(BuildContext context) {
    return TextFormField(
      autofocus: true,
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
    );
  }

  _onAdd() async {
    BlocProvider.of<McServerListBloc>(context).add(McServerListAdd(_server));
    Navigator.pop(context);
  }

  Widget _buildCancelButton(BuildContext context) {
    return FlatButton(
      child: Text(
        S.of(context).add_cancel_button,
        style: TextStyle(color: AppTheme.high_emphasis),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    final disabled = (_error != null || _server == null);
    return FlatButton(
      child: Text(
        S.of(context).add_button,
        style: TextStyle(
            color: disabled ? AppTheme.medium_emphasis : AppTheme.primary),
      ),
      onPressed: disabled ? null : _onAdd,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      disabledTextColor: AppTheme.medium_emphasis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: _buildTitle(context),
      content: _buildInput(context),
      actions: <Widget>[
        _buildCancelButton(context),
        _buildSaveButton(context),
      ],
    );
  }
}
