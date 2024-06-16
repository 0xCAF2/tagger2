import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tagger2/domain/entity/tag.dart';
import 'package:tagger2/domain/repository/tags_repository.dart';

part 'tags.g.dart';

@Riverpod(keepAlive: true)
class Tags extends _$Tags {
  @override
  FutureOr<List<Tag>> build() async {
    final repo = ref.watch(tagsRepositoryProvider);
    return repo.retrieveAll();
  }
}
