import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child; // Сюда go_router будет подставлять наши страницы

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NYXAL STUDIO',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        elevation: 0,
        backgroundColor: Colors.black, // Dark mode стиль
        actions: [
          TextButton(
            onPressed: () => context.go('/'),
            child: const Text('ГЛАВНАЯ', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () => context.go('/projects'),
            child: const Text('ПРОЕКТЫ', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () => context.go('/about'),
            child: const Text('О НАС', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 20),
          // Заготовка под кнопку поиска
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Позже прикрутим сюда вызов поиска через Cubit
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Поиск в разработке...')),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      // Оборачиваем child в Center или Container по вкусу
      body: child,
    );
  }
}
