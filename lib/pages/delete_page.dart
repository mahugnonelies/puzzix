import 'package:flutter/material.dart';
import '../i18n/i18n.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECEF),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          context.tr('delete.appbar'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SelectionArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _H(context.tr('delete.heading')),
                const SizedBox(height: 8),
                _P(context.tr('delete.intro')),
                const SizedBox(height: 8),
                _P(context.tr('delete.email_line')),
                const SizedBox(height: 8),
                _P(context.tr('delete.deadline')),
                const SizedBox(height: 8),
                _Warn(context.tr('delete.warning')),
                const SizedBox(height: 20),

                _H2(context.tr('delete.proc_title')),
                _UL(items: [
                  context.tr('delete.proc_1'),
                  context.tr('delete.proc_2'),
                  context.tr('delete.proc_3'),
                ]),
                const SizedBox(height: 20),

                _H2(context.tr('delete.notes_title')),
                _UL(items: [
                  context.tr('delete.note_1'),
                  context.tr('delete.note_2'),
                ]),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _H extends StatelessWidget {
  final String text;
  const _H(this.text);
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: Color(0xFF2F4F4F),
    ),
  );
}

class _H2 extends StatelessWidget {
  final String text;
  const _H2(this.text);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 6),
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

class _P extends StatelessWidget {
  final String text;
  const _P(this.text);
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(height: 1.45),
  );
}

class _Warn extends StatelessWidget {
  final String text;
  const _Warn(this.text);
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.amber.shade100,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.amber.shade700),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Icon(Icons.warning_amber_rounded, size: 20),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(height: 1.45))),
      ],
    ),
  );
}

class _UL extends StatelessWidget {
  final List<String> items;
  const _UL({required this.items});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items
        .map((e) => Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  '),
          Expanded(child: Text(e, style: const TextStyle(height: 1.45))),
        ],
      ),
    ))
        .toList(),
  );
}
