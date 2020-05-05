import 'package:flutter/material.dart';
import 'package:mcss/generated/i18n.dart';

enum Category {
  mcServers,
  mojangServers,
}

extension CategoryExtension on Category {
  String translate(BuildContext context) {
    switch(this) {
      case Category.mcServers:
        return S.of(context).category_my_servers;
      case Category.mojangServers:
        return S.of(context).category_mojang_servers;
        default:
          return throw Exception('Could not translate $this');
    }
  }
}