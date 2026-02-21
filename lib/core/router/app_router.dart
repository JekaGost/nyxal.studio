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
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(
          path: '/projects',
          builder: (context, state) => const ProjectsPage(),
        ),
        GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
      ],
    ),
  ],
);
