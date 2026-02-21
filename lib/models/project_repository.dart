import '../models/project.dart';

abstract class ProjectRepository {
  // Метод возвращает Future, так как получение данных обычно асинхронно
  Future<List<Project>> getProjects();
}
