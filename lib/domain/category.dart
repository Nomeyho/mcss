import 'package:flutter/material.dart';
import 'package:mcss/generated/i18n.dart';

enum Category {
  myServers,
  mojang,
}

extension CategoryExtension on Category {
  String translate(BuildContext context) {
    switch(this) {
      case Category.myServers:
        return S.of(context).category_my_servers;
      case Category.mojang:
        return S.of(context).category_mojang_servers;
        default:
          return throw Exception('Could not translate $this');
    }
  }
}