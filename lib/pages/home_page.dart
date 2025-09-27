import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/feature_cards.dart';
import '../widgets/footer.dart';
import '../widgets/hero_header.dart';
import '../widgets/lang_toggle.dart';
import '../i18n/i18n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxW = 1200.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('app.title')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/privacy'),
            child: Text(context.tr('nav.privacy')),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/legal'),
            child: Text(context.tr('nav.legal')),
          ),
          const LangToggle(),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: const HeroHeader(),
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: const FeatureCards(),
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: _ctaSection(context),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _ctaSection(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (context, c) {
            final isNarrow = c.maxWidth < 720;
            return isNarrow
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ctaText(context),
                const SizedBox(height: 16),
                _storeButtons(context),
              ],
            )
                : Row(
              children: [
                Expanded(child: _ctaText(context)),
                const SizedBox(width: 24),
                _storeButtons(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _ctaText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.tr('cta.headline'),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        Text(context.tr('cta.text'), style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }

  Widget _storeButtons(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _pillButton(context.tr('cta.play'),
            Uri.parse('https://play.google.com/store/apps/details?id=com.puzzix.app')),
        _pillButton(context.tr('cta.appstore'),
            Uri.parse('https://apps.apple.com/app/idXXXXXXXXX')),
      ],
    );
  }

  Widget _pillButton(String label, Uri url) {
    return FilledButton.tonal(
      onPressed: () => launchUrl(url, mode: LaunchMode.externalApplication),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(label),
    );
  }
}
