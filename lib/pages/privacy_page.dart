import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        title: Text(context.tr('privacy.appbar')),
      ),
      body: SafeArea(
        child: SelectionArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            children: [
              Text(
                context.tr('privacy.heading'),
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                context.tr('privacy.updated'),
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 16),

              _p(context.tr('privacy.intro')),

              _h(context, 'privacy.controller_title'),
              _p(context.tr('privacy.controller_body')),

              _h(context, 'privacy.data_title'),
              _b(context.tr('privacy.data_needed_title')),
              _ul([
                context.tr('privacy.data_needed_1'),
                context.tr('privacy.data_needed_2'),
                context.tr('privacy.data_needed_3'),
                context.tr('privacy.data_needed_4'),
                context.tr('privacy.data_needed_5'),
              ]),
              _b(context.tr('privacy.data_not_title')),
              _ul([
                context.tr('privacy.data_not_1'),
                context.tr('privacy.data_not_2'),
                context.tr('privacy.data_not_3'),
              ]),

              _h(context, 'privacy.purposes_title'),
              _ul([
                context.tr('privacy.purpose_1'),
                context.tr('privacy.purpose_2'),
                context.tr('privacy.purpose_3'),
                context.tr('privacy.purpose_4'),
                context.tr('privacy.purpose_5'),
              ]),

              _h(context, 'privacy.cookies_title'),
              _p(context.tr('privacy.cookies_body')),

              _h(context, 'privacy.shared_title'),
              _p(context.tr('privacy.shared_intro')),
              _ul([
                context.tr('privacy.shared_1'),
                context.tr('privacy.shared_2'),
                context.tr('privacy.shared_3'),
              ]),
              _p(context.tr('privacy.shared_note')),

              _h(context, 'privacy.retention_title'),
              _ul([
                context.tr('privacy.retention_1'),
                context.tr('privacy.retention_2'),
                context.tr('privacy.retention_3'),
              ]),

              _h(context, 'privacy.transfers_title'),
              _p(context.tr('privacy.transfers_body')),

              _h(context, 'privacy.rights_title'),
              _p(context.tr('privacy.rights_body')),
              _p(context.tr('privacy.contact_line')),

              _h(context, 'privacy.security_title'),
              _p(context.tr('privacy.security_body')),

              _h(context, 'privacy.minors_title'),
              _p(context.tr('privacy.minors_body')),

              _h(context, 'privacy.changes_title'),
              _p(context.tr('privacy.changes_body')),

              _h(context, 'privacy.contact_title'),
              _p(context.tr('privacy.contact_block')),
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

  static Widget _b(String text) => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 4),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
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
