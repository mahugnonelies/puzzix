import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTitle = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);
    final styleH = Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);

    return Scaffold(
      appBar: AppBar(title: Text(context.tr('privacy.title'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(context.tr('privacy.title'), style: styleTitle),
          const SizedBox(height: 12),
          Text(context.tr('privacy.body')),
          const SizedBox(height: 16),
          Text('Contact', style: styleH),
          Text(context.tr('privacy.contact')),
        ],
      ),
    );
  }
}
