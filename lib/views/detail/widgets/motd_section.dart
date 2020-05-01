import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:mcss/widgets/section_header.dart';
import 'package:provider/provider.dart';

class MotdSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AppState>(context).mcServerStatus;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(
            title: 'MOTD',
            subtitle: '',
          ),
          ChatObjectText(
            rootChatObject: status.description,
            fontSize: 16,
          )
        ],
      ),
    );
  }
}
