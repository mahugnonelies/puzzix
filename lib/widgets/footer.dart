import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../i18n/i18n.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year.toString();
    final text = context.tr('footer.copyright').replaceFirst('{y}', year);

    return Container(
      color: Colors.blueGrey[900],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                onPressed: () => context.go('/privacy'),
                child: Text(context.tr('nav.privacy'),
                    style: const TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => context.go('/terms'),
                child: Text(context.tr('nav.terms'),
                    style: const TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => context.go('/legal'),
                child: Text(context.tr('nav.legal'),
                    style: const TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => context.go('/delete'),
                child: Text(context.tr('nav.delete'),
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 16), // espace avant le copyright
          Text(
            text,
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
