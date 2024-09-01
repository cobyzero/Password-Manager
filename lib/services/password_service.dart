import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/main.dart';

class PasswordService {
  static const tableName = "passwords";

  Future<void> createPassword(PasswordModel password) async {
    await databaseService.db.insert(tableName, password.toJson());
  }

  Future<List<PasswordModel>> getAllPasswords() async {
    final maps = await databaseService.db.query(tableName);
    return maps.map((map) => PasswordModel.fromJson(map)).toList();
  }

  Future<void> updatePassword(PasswordModel password) async {
    await databaseService.db.update(tableName, password.toJson(), where: 'id = ?', whereArgs: [password.id]);
  }

  Future<void> deleteUser(int id) async {
    await databaseService.db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
