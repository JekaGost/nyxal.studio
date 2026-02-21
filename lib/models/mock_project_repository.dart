import '../core/data/mock_projects.dart';
import '../models/project.dart';
import 'project_repository.dart';

class MockProjectRepository implements ProjectRepository {
  @override
  Future<List<Project>> getProjects() async {
    // Возвращаем данные мгновенно, чтобы не было лишнего лоадера при переходе
    return mockProjects;
  }
}
