// lib/main.dart (puzzix_site)
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // ⬅️ IMPORTANT
import 'package:google_fonts/google_fonts.dart';

import 'router.dart';
import 'i18n/i18n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PuzzixSite());
}

class PuzzixSite extends StatelessWidget {
  const PuzzixSite({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorSchemeSeed: const Color(0xFF2F7D32),
      brightness: Brightness.light,
      textTheme: GoogleFonts.interTextTheme(),
      useMaterial3: true,
    );

    final initial = I18n.autoDetect();

    return I18n(
      initial: initial,
      // On crée d'abord un contexte pour lire l'instance I18n existante
      child: Builder(
        builder: (rootCtx) {
          final langListenable = I18n.of(rootCtx).lang; // ValueNotifier<AppLang>
          return ValueListenableBuilder<AppLang>(
            valueListenable: langListenable,
            builder: (ctx, lang, _) {
              return MaterialApp.router(
                title: 'Puzzix',
                debugShowCheckedModeBanner: false,
                theme: theme,
                // fr/en en fonction de ton I18n
                locale: Locale(lang == AppLang.fr ? 'fr' : 'en'),
                supportedLocales: const [Locale('en'), Locale('fr')],
                // ⬇️ Ces délégués évitent l’erreur "No MaterialLocalizations found"
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                routerConfig: router,
              );
            },
          );
        },
      ),
    );
  }
}
