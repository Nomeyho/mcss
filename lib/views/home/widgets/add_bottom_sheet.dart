import 'package:flutter/material.dart' hide Banner;
import 'package:mcss/app_state.dart';
import 'package:mcss/app_theme.dart';
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
  String _address = '';
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

  _validateIp(BuildContext context) {
    if (_address == null || _address.isEmpty) {
      return S.of(context).error_empty_ip;
    }

    // validate port number, if provided
    if (_address.contains(':')) {
      final index = _address.lastIndexOf(':');
      final port = int.tryParse(_address.substring(index + 1));

      if (port == null) {
        return S.of(context).error_invalid_port;
      } else if (port < 0) {
        return S.of(context).error_negative_port;
      } else if (port > 65535) {
        return S.of(context).error_too_large_port;
      }
    }

    return null;
  }

  Widget _buildInput(BuildContext context) {
    return Expanded(
      child: TextFormField(
        autofocus: true,
        onChanged: (value) {
          setState(() {
            _address = value;
            _error = _validateIp(context);
          });
        },
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
    // TODO disabled until valid input
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: _error == null ? () {
        final state = Provider.of<AppState>(context, listen: false);
        state.addServer(server);
      } : null,
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
