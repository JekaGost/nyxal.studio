import 'package:flutter/material.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(const NyxalApp());
}

class NyxalApp extends StatelessWidget {
  const NyxalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nyxal Studio',
      debugShowCheckedModeBanner: false,
      // Включаем темную тему по умолчанию
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(
          0xFF121212,
        ), // Глубокий темный цвет
        primaryColor: Colors.black,
      ),
      routerConfig: appRouter, // Подключаем наш go_router
    );
  }
}
