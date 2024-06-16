import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tagger2/data/datasource/shared_preferences_datasource.dart';
import 'package:tagger2/data/repository_impl/tag_repository_impl.dart';
import 'package:tagger2/domain/repository/tags_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        tagsRepositoryProvider.overrideWith(
          (_) => TagRepositoryImpl(
            SharedPreferencesDataSource(),
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
