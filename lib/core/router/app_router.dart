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
  return CustomTransitionPage(
    key: state.pageKey, // ВАЖНО: Ключ сообщает роутеру, что это новая страница
    child: Scaffold(body: child),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Добавим кривую (Curve) для более плавного и естественного эффекта
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}
