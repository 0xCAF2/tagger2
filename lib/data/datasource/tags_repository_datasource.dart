import 'package:tagger2/domain/entity/tag.dart';

abstract class TagsRepositoryDataSource {
  Future<List<Tag>> retrieveAll();
}
