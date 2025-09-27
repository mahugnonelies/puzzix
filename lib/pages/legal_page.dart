import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(title: Text(context.tr('legal.title'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(context.tr('legal.title'), style: title),
          const SizedBox(height: 12),
          Text(context.tr('legal.body')),
        ],
      ),
    );
  }
}
