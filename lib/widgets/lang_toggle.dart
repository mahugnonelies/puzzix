import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class LangToggle extends StatelessWidget {
  const LangToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLang>(
      valueListenable: context.langNotifier,
      builder: (_, lang, __) {
        return DropdownButton<AppLang>(
          value: lang,
          onChanged: (v) => v == null ? null : context.setLang(v),
          underline: const SizedBox.shrink(),
          items: const [
            DropdownMenuItem(value: AppLang.en, child: Text('English')),
            DropdownMenuItem(value: AppLang.fr, child: Text('Français')),
          ],
        );
      },
    );
  }
}
