import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/widgets/section_header.dart';
import 'package:provider/provider.dart';

class PingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AppState>(context).mcServerStatus;

    return Padding(
      padding: EdgeInsets.all(8),
      child: SectionHeader(
        title: 'Ping: ',
        subtitle: '${status.ms} ms',
      ),
    );
  }
}
