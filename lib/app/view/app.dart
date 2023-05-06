import 'package:flutter/material.dart';
import 'package:qoway/app/constants/color_schemes.dart';
import 'package:qoway/app/routes/route_generator.dart';
// import 'package:qoway/app/constants/theme.dart';
// import 'package:qoway/counter/counter.dart';
import 'package:qoway/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // const qowayTheme = QowayTheme();
    return MaterialApp(
      title: 'Qoway',
      debugShowCheckedModeBanner: false,
      // theme: qowayTheme.toThemeData(),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
