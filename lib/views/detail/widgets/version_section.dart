import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/widgets/section_header.dart';
import 'package:provider/provider.dart';

class VersionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AppState>(context).mcServerStatus;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SectionHeader(
        title: 'Version: ',
        subtitle: '${status.version.name}',
      ),
    );
  }
}
