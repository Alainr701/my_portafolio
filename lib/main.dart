import 'package:flutter/material.dart';
import 'package:my_portafolio/providers/app_provider.dart';
import 'package:my_portafolio/ui/modules/macos/macos.dart';
import 'package:provider/provider.dart';
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Portafolio',
          // theme: ThemeData(
          //   useMaterial3: true,
          //   colorSchemeSeed: Colors.amber,
          //   fontFamily: 'Poppins',
          // ),
          home: const MacOs(),
        ));
  }
}
