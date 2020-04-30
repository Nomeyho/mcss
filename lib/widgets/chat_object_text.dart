import 'package:dart_mc_ping/model/chat_object.dart';
import 'package:flutter/material.dart';

class ChatObjectText extends StatelessWidget {
  final ChatObject rootChatObject;

  const ChatObjectText({
    Key key,
    this.rootChatObject,
  }) : super(key: key);

  Color getColor(ChatObject chatObject) {
    return chatObject.color == null ? null : Color(chatObject.color.hex);
  }

  FontWeight getFontWeight(ChatObject chatObject) {
    return (chatObject.bold != null && chatObject.bold == true)
        ? FontWeight.w700
        : FontWeight.w400;
  }

  FontStyle getFontStyle(ChatObject chatObject) {
    return (chatObject.italic != null && chatObject.italic == true)
        ? FontStyle.italic
        : FontStyle.normal;
  }

  TextDecoration getUnderlined(ChatObject chatObject) {
    return (chatObject.underlined != null && chatObject.underlined == true)
        ? TextDecoration.underline
        : TextDecoration.none;
  }

  TextDecoration getLineThrough(ChatObject chatObj) {
    return (chatObj.strikethrough != null && chatObj.strikethrough == true)
        ? TextDecoration.lineThrough
        : TextDecoration.none;
  }

  TextSpan _text(ChatObject chatObject) {
    return TextSpan(
      text: chatObject.text,
      style: TextStyle(
        color: getColor(chatObject),
        fontFamily: 'Lato',
        fontSize: 14,
        fontWeight: getFontWeight(chatObject),
        fontStyle: getFontStyle(chatObject),
        decoration: TextDecoration.combine([
          getUnderlined(chatObject),
          getLineThrough(chatObject),
        ]),
      ),
      children: chatObject.extra.map((extra) => _text(extra)).toList(growable: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _text(rootChatObject),
    );
  }
}
