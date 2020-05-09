import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_bloc.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_event.dart';
import 'package:mcss/bloc/mc_server_list_bloc/mc_server_list_state.dart';
import 'package:mcss/domain/mc_server.dart';
import 'package:mcss/generated/i18n.dart';

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
  final Logger log = Logger('MCSS.AddBottomSheet');

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
    /// TODO prevent duplicates...
    BlocProvider.of<McServerListBloc>(context).add(McServerListAdd(_server));
    Navigator.pop(context);
  }

  Widget _buildButton(BuildContext context) {
    return FlatButton(
      color: AppTheme.primary,
      child: Text(
        S.of(context).add_button,
        style: TextStyle(color: AppTheme.background),
      ),
      onPressed: (_error == null && _server != null) ? _onAdd : null,
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
      height: 160,
      width: width,
      padding: EdgeInsets.only(
        left: 12,
        top: 24,
        right: 12,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: AppTheme.medium_black,
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
