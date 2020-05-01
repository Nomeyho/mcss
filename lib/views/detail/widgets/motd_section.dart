import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:mcss/widgets/chat_object_text.dart';
import 'package:provider/provider.dart';

class MotdSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AppState>(context).mcServerStatus;
    return Center(
      child: ChatObjectText(rootChatObject: status.description),
    );
  }
}
