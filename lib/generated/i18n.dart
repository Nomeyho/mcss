import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get add_button => "Add";
  String get add_cancel_button => "Cancel";
  String get add_server_hint => "play.hypixel.net";
  String get add_server_ip => "Server IP";
  String get add_title => "New server";
  String get category_mojang_servers => "Mojang servers";
  String get category_my_servers => "My servers";
  String get error_already_exist => "This server already exist";
  String get error_empty_ip => "Server IP is empty";
  String get error_invalid_port => "Invalid port number";
  String get error_negative_port => "Port number cannot be negative";
  String get error_too_large_port => "Port number cannot be greater than 65535";
  String get home_title => "Minecraft Server Status";
  String get ping_title => "Ping: ";
  String get player_title => "Online players: ";
  String get server_card_error => "Error";
  String get server_card_loading => "Loading...";
  String get server_card_players => "players";
  String get server_list_empty => "Start by adding a new server";
  String get server_list_error => "Could not server status";
  String get version_title => "Version: ";
}

class $en extends S {
  const $en();
}

class $fr extends S {
  const $fr();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get add_server_hint => "play.hypixel.net";
  @override
  String get error_too_large_port => "Le port ne peut pas être supérieur à 65535";
  @override
  String get error_already_exist => "Ce serveur existe déjà";
  @override
  String get error_negative_port => "Le port ne peut pas être négatif";
  @override
  String get server_card_players => "joueurs";
  @override
  String get add_button => "Ajouter";
  @override
  String get add_cancel_button => "Annuler";
  @override
  String get ping_title => "Ping: ";
  @override
  String get home_title => "Minecraft Server Status";
  @override
  String get server_card_loading => "Chargement...";
  @override
  String get version_title => "Version: ";
  @override
  String get server_list_empty => "Commence par ajouter un serveur";
  @override
  String get category_mojang_servers => "Mojang serveurs";
  @override
  String get server_card_error => "Erreur";
  @override
  String get player_title => "Joueurs en ligne: ";
  @override
  String get add_title => "Nouveau serveur";
  @override
  String get add_server_ip => "IP du serveur";
  @override
  String get error_invalid_port => "Le port invalide";
  @override
  String get server_list_error => "Le status des serveurs n'a pas pu être récupéré";
  @override
  String get category_my_servers => "Mes serveurs";
  @override
  String get error_empty_ip => "L'IP du serveur est vide";
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("fr", ""),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        case "fr":
          S.current = const $fr();
          return SynchronousFuture<S>(S.current);
        default:
          // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
