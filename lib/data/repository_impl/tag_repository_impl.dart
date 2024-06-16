import 'package:tagger2/data/datasource/tags_repository_datasource.dart';
import 'package:tagger2/domain/entity/tag.dart';
import 'package:tagger2/domain/repository/tags_repository.dart';

class TagRepositoryImpl implements TagsRepository {
  final TagsRepositoryDataSource _dataSource;

  const TagRepositoryImpl(this._dataSource);

  @override
  Future<List<Tag>> retrieveAll() {
    return _dataSource.retrieveAll();
  }
}
