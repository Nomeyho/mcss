import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mcss/app_theme.dart';
import 'package:mcss/config.dart';
import 'package:mcss/generated/i18n.dart';
import 'package:mcss/router.dart';
import 'package:mcss/widgets/banner.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minecraft Server Status',
      initialRoute: Router.home,
      onGenerateRoute: Router.generateRoute,
      builder: (context, app) => Column(
          children: <Widget>[
            Expanded(child: app),
            Banner(),
          ]
      ),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (locale, locales) {
        // locale = Locale('fr');
        return S.delegate.resolution(
          fallback: Locale('en', ''),
          withCountry: false,
        )(locale, locales);
      },
      debugShowCheckedModeBanner: Config.debug,
      theme: AppTheme.themeData,
    );
  }
}
