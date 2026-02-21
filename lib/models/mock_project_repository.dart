import '../core/data/mock_projects.dart';
import '../models/project.dart';
import 'project_repository.dart';

class MockProjectRepository implements ProjectRepository {
  @override
  Future<List<Project>> getProjects() async {
    // Имитируем задержку сети (например, 1 секунда), чтобы увидеть индикатор загрузки
    await Future.delayed(const Duration(seconds: 1));
    return mockProjects;
  }
}
