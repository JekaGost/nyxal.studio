import '../../models/project.dart';

final List<Project> mockProjects = [
  const Project(
    id: '1',
    title: 'Dark Mode App',
    shortDescription: 'Стильное утилитное приложение с плавной анимацией.',
    fullDescription:
        'Подробное описание того, как я использовал паттерн BLoC и сложные анимации для создания этого приложения...',
    tags: ['Flutter', 'Dart', 'UI/UX'],
    projectUrl: 'https://github.com/твое_имя/project1',
  ),
  const Project(
    id: '2',
    title: 'Neon Runner',
    shortDescription: 'Мобильная 3D игра в жанре бесконечного раннера.',
    fullDescription:
        'Игра разработана с использованием кастомных шейдеров и оптимизирована под мобильные устройства...',
    tags: ['Unity', 'C#', 'Mobile Game'],
    projectUrl: 'https://play.google.com/store/apps/details?id=com.nyxal.neon',
  ),
];
