import 'package:flutter/material.dart';
import 'package:my_portafolio/providers/app_provider.dart';
import 'package:my_portafolio/ui/modules/macos/macos.dart';
import 'package:my_portafolio/ui/modules/macos/splash_macos.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppProvider(),
          ),
        ],
        builder: (context, child) => VRouter(
              title: 'My Portafolio',
              debugShowCheckedModeBanner: false,
              initialUrl: MacOs.routeName,
              theme: ThemeData(
                  // fontFamily: 'Cabin',
                  ),
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('es', 'ES'),
              ],
              // builder: EasyLoading.init(),
              localizationsDelegates: const <LocalizationsDelegate>[
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              routes: routes,
            ));
  }

  List<VRouteElement> get routes => [
        VWidget(
          path: MacOs.routeName,
          widget: const SplashMacOS(),
        ),
      ];
}
