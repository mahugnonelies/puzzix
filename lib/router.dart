import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home_page.dart';
import 'pages/privacy_page.dart';
import 'pages/legal_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (ctx, st) => const HomePage()),
    GoRoute(path: '/privacy', builder: (ctx, st) => const PrivacyPage()),
    GoRoute(path: '/legal', builder: (ctx, st) => const LegalPage()),
  ],
  errorBuilder: (ctx, st) => const Scaffold(
    body: Center(child: Text('404 • Page not found')),
  ),
);
