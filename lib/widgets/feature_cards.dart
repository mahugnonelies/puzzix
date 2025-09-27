import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class FeatureCards extends StatelessWidget {
  const FeatureCards({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _Feature(
        icon: Icons.extension,
        title: context.tr('feat.1.title'),
        text: context.tr('feat.1.text'),
      ),
      _Feature(
        icon: Icons.notifications_active,
        title: context.tr('feat.2.title'),
        text: context.tr('feat.2.text'),
      ),
      _Feature(
        icon: Icons.splitscreen,
        title: context.tr('feat.3.title'),
        text: context.tr('feat.3.text'),
      ),
    ];

    final isNarrow = MediaQuery.sizeOf(context).width < 840;
    final crossAxis = isNarrow ? 1 : 3;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxis,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: isNarrow ? 16/6 : 4/3,
        children: items.map((e) => _card(context, e)).toList(),
      ),
    );
  }

  Widget _card(BuildContext ctx, _Feature f) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(f.icon, size: 28, color: Theme.of(ctx).colorScheme.primary),
            const SizedBox(height: 12),
            Text(f.title, style: Theme.of(ctx).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(f.text),
          ],
        ),
      ),
    );
  }
}

class _Feature {
  final IconData icon;
  final String title;
  final String text;
  const _Feature({required this.icon, required this.title, required this.text});
}
