import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../ui/layout/main_layout.dart';
import '../../ui/pages/about_page.dart';
import '../../ui/pages/home_page.dart';
import '../../ui/pages/projects_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      // ShellRoute оборачивает все вложенные роуты в наш MainLayout
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _buildPage(const HomePage()),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) => _buildPage(const ProjectsPage()),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) => _buildPage(const AboutPage()),
        ),
      ],
    ),
  ],
);

// Хелпер: создает страницу с непрозрачным фоном автоматически
Page<dynamic> _buildPage(Widget child) {
  return MaterialPage(
    child: Scaffold(
      // Scaffold автоматически берет цвет фона из темы (Theme.of(context).scaffoldBackgroundColor)
      // Это гарантирует, что страница будет непрозрачной при анимации перехода
      body: child,
    ),
  );
}
