import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        title: Text(
          context.tr('legal.appbar'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(context.tr('legal.heading')),

                _SectionSubtitle(context.tr('legal.publisher_title')),
                Text(context.tr('legal.publisher_body')),
                const SizedBox(height: 16),

                _SectionSubtitle(context.tr('legal.director_title')),
                Text(context.tr('legal.director_body')),
                const SizedBox(height: 16),

                _SectionSubtitle(context.tr('legal.hosting_title')),
                Text(context.tr('legal.hosting_body')),
                const SizedBox(height: 16),

                _SectionSubtitle(context.tr('legal.ip_title')),
                Text(context.tr('legal.ip_body')),
                const SizedBox(height: 16),

                _SectionSubtitle(context.tr('legal.liability_title')),
                Text(context.tr('legal.liability_body')),
                const SizedBox(height: 16),

                _SectionSubtitle(context.tr('legal.data_title')),
                Text(context.tr('legal.data_body')),
                const SizedBox(height: 16),

                _SectionSubtitle(context.tr('legal.law_title')),
                Text(context.tr('legal.law_body')),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color(0xFF2F4F4F),
      ),
    );
  }
}

class _SectionSubtitle extends StatelessWidget {
  final String text;
  const _SectionSubtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1E5631),
        ),
      ),
    );
  }
}
