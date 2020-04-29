import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:dart_mc_ping/model/status_response.dart';
import 'package:flutter/material.dart';
import 'package:mcss/app_state.dart';
import 'package:provider/provider.dart';

class MotdSection extends StatelessWidget {
  TextSpan _text(ChatObject chatObject) {
    return TextSpan(
      text: chatObject.text,
      style: TextStyle(
        color: chatObject.color == null ? null : Color(chatObject.color.hex),
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: (chatObject.bold != null && chatObject.bold == true)
            ? FontWeight.w700
            : FontWeight.w400,
        fontStyle: (chatObject.italic != null && chatObject.italic == true)
            ? FontStyle.italic
            : FontStyle.normal,
        decoration: TextDecoration.combine([
          (chatObject.underlined != null && chatObject.underlined == true)
              ? TextDecoration.underline
              : TextDecoration.none,
          (chatObject.strikethrough != null && chatObject.strikethrough == true)
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ]),
      ),
      children: chatObject.extra
          .map((extra) => _text(extra))
          .toList(growable: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AppState>(context).mcServerStatus,
      builder: (context, AsyncSnapshot<StatusResponse> snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: RichText(
              text: _text(snapshot.data.description),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
