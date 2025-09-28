import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/privacy_page.dart';
import 'pages/terms_page.dart';
import 'pages/legal_page.dart';
import 'pages/delete_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (ctx, st) => const HomePage()),
    GoRoute(path: '/privacy', builder: (ctx, st) => const PrivacyPage()),
    GoRoute(path: '/legal', builder: (ctx, st) => const LegalPage()),
    GoRoute(path: '/terms', builder: (ctx, st) => const TermsPage()),
    GoRoute(path: '/delete', builder: (ctx, st) => const DeletePage()),
  ],
  errorBuilder: (ctx, st) => const Scaffold(
    body: Center(child: Text('404 • Page not found')),
  ),
);
