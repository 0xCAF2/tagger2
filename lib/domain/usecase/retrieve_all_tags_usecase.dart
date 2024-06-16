import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tagger2/domain/entity/tag.dart';
import 'package:tagger2/domain/repository/tags.dart';

part 'retrieve_all_tags_usecase.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<Tag>> retriveAllTagsUseCase(
  RetriveAllTagsUseCaseRef ref,
) {
  return ref.watch(tagsProvider.future);
}
