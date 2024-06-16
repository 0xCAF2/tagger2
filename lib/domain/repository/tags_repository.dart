import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tagger2/domain/entity/tag.dart';

part 'tags_repository.g.dart';

abstract class TagsRepository {
  Future<List<Tag>> retrieveAll();
}

@Riverpod(keepAlive: true)
TagsRepository tagsRepository(TagsRepositoryRef ref) {
  throw UnimplementedError(); // override in ProviderScope
}
