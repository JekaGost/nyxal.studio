import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Этот файл будет сгенерирован автоматически
part 'project.freezed.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    required String id,
    required String title,
    required String shortDescription,
    required String fullDescription,
    required List<String>
    tags, // Например: ['Flutter', 'Dart'] или ['Unity', 'C#']
    String? imageUrl, // Ссылка на картинку (может быть null)
    String? projectUrl, // Ссылка на Google Play или GitHub (может быть null)
  }) = _Project;
}
