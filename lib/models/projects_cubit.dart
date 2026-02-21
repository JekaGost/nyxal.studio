import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_repository.dart';
import 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  final ProjectRepository _repository;

  ProjectsCubit(this._repository) : super(const ProjectsState.initial());

  Future<void> loadProjects() async {
    try {
      emit(const ProjectsState.loading());
      final projects = await _repository.getProjects();
      if (!isClosed) emit(ProjectsState.loaded(projects));
    } catch (e) {
      if (!isClosed)
        emit(const ProjectsState.error('Не удалось загрузить проекты'));
    }
  }
}
