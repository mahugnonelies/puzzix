import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.sizeOf(context).width < 820;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Flex(
        direction: isSmall ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: isSmall ? 0 : 1,
            child: Column(
              crossAxisAlignment: isSmall ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('hero.title'),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr('hero.subtitle'),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: isSmall ? TextAlign.center : TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24, height: 24),
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.black12,
                  child: Image.asset(
                    'assets/screenshots/hero.png',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Center(
                      child: Text(
                        'Add a screenshot at\nassets/screenshots/hero.png',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
