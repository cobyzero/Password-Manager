import 'package:password_manager/core/models/section_model.dart';
import 'package:password_manager/main.dart';

class SectionService {
  static const tableName = "sections";

  Future<void> createSection(SectionModel section) async {
    await databaseService.db.insert(tableName, section.toJson());
  }

  Future<List<SectionModel>> getAllSections() async {
    final maps = await databaseService.db.query(tableName);
    return maps.map((map) => SectionModel.fromJson(map)).toList();
  }

  Future<void> updateSection(SectionModel section) async {
    await databaseService.db.update(tableName, section.toJson(), where: 'id = ?', whereArgs: [section.id]);
  }

  Future<void> deleteSection(int id) async {
    await databaseService.db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
