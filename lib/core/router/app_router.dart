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
        // Оборачиваем child в KeyedSubtree с ключом страницы.
        // Это ОБЯЗАТЕЛЬНО, чтобы AnimatedSwitcher в MainLayout увидел изменение
        // и запустил анимацию перехода.
        return MainLayout(
          child: KeyedSubtree(key: state.pageKey, child: child),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _buildPage(state, const HomePage()),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) =>
              _buildPage(state, const ProjectsPage()),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) => _buildPage(state, const AboutPage()),
        ),
      ],
    ),
  ],
);

// Хелпер: создает страницу с непрозрачным фоном автоматически
Page<dynamic> _buildPage(GoRouterState state, Widget child) {
  // Используем NoTransitionPage, так как анимацию теперь обрабатывает MainLayout
  return NoTransitionPage(
    child: Scaffold(
      key: state
          .pageKey, // ВАЖНО: Ключ заставляет AnimatedSwitcher видеть смену страниц
      body: child,
    ),
  );
}
