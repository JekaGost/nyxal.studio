import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/mock_project_repository.dart';
import '../../models/project.dart';
import '../../models/projects_cubit.dart';
import '../../models/projects_state.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Внедряем Cubit в дерево виджетов.
    // Используем MockProjectRepository (позже заменим на реальный).
    return BlocProvider(
      create: (context) =>
          ProjectsCubit(MockProjectRepository())..loadProjects(),
      child: const _ProjectsView(),
    );
  }
}

class _ProjectsView extends StatelessWidget {
  const _ProjectsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<ProjectsCubit, ProjectsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Text(
                'Ошибка: $message',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            loaded: (projects) => ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return _ProjectCard(project: projects[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: const Color(0xFF1E1E1E), // Темно-серый фон карточки
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (project.projectUrl != null) {
            launchUrl(Uri.parse(project.projectUrl!));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                project.shortDescription,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: project.tags.map((tag) {
                  return Chip(
                    label: Text(tag, style: const TextStyle(fontSize: 10)),
                    backgroundColor: Colors.black54,
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
