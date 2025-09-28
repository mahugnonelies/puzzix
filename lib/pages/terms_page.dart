import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        title: Text(context.tr('terms.appbar')),
      ),
      body: SafeArea(
        child: SelectionArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            children: [
              Text(
                context.tr('terms.heading'),
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                context.tr('terms.updated'),
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 16),

              _h(context, 'terms.s1_title'),
              _p(context.tr('terms.s1_body')),

              _h(context, 'terms.s2_title'),
              _p(context.tr('terms.s2_body')),

              _h(context, 'terms.s3_title'),
              _ul([
                context.tr('terms.s3_1'),
                context.tr('terms.s3_2'),
                context.tr('terms.s3_3'),
              ]),

              _h(context, 'terms.s4_title'),
              _ul([
                context.tr('terms.s4_1'),
                context.tr('terms.s4_2'),
              ]),

              _h(context, 'terms.s5_title'),
              _ul([
                context.tr('terms.s5_1'),
                context.tr('terms.s5_2'),
                context.tr('terms.s5_3'),
              ]),

              _h(context, 'terms.s6_title'),
              _ul([
                context.tr('terms.s6_1'),
                context.tr('terms.s6_2'),
              ]),

              _h(context, 'terms.s7_title'),
              _ul([
                context.tr('terms.s7_1'),
                context.tr('terms.s7_2'),
                context.tr('terms.s7_3'),
              ]),

              _h(context, 'terms.s8_title'),
              _p(context.tr('terms.s8_body')),

              _h(context, 'terms.s9_title'),
              _ul([
                context.tr('terms.s9_1'),
                context.tr('terms.s9_2'),
                context.tr('terms.s9_3'),
              ]),

              _h(context, 'terms.s10_title'),
              _p(context.tr('terms.s10_body')),

              _h(context, 'terms.s11_title'),
              _ul([
                context.tr('terms.s11_1'),
                context.tr('terms.s11_2'),
              ]),

              _h(context, 'terms.s12_title'),
              _ul([
                context.tr('terms.s12_1'),
                context.tr('terms.s12_2'),
              ]),

              _h(context, 'terms.s13_title'),
              _p(context.tr('terms.s13_body')),

              _h(context, 'terms.s14_title'),
              _p(context.tr('terms.s14_body')),

              _h(context, 'terms.s15_title'),
              _p(context.tr('terms.s15_body')),
            ],
          ),
        ),
      ),
    );
  }

  // --- helpers UI ---
  static Widget _h(BuildContext context, String key) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8),
    child: Text(
      context.tr(key),
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
    ),
  );

  static Widget _p(String text) => Padding(
    padding: const EdgeInsets.only(top: 2),
    child: Text(text, style: const TextStyle(height: 1.4)),
  );

  static Widget _ul(List<String> items) => Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (e) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  '),
              Expanded(child: Text(e)),
            ],
          ),
        ),
      )
          .toList(),
    ),
  );
}
