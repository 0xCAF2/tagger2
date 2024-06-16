import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagger2/data/datasource/tags_repository_datasource.dart';
import 'package:tagger2/domain/entity/keys.dart';
import 'package:tagger2/domain/entity/tag.dart';

class SharedPreferencesDataSource implements TagsRepositoryDataSource {
  @override
  Future<List<Tag>> retrieveAll() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getStringList(Keys.retrieveAllTagsKey) ?? [];
    return json.map((e) => Tag.fromJson(jsonDecode(e))).toList();
  }
}
