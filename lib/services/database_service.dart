import 'package:password_manager/services/password_service.dart';
import 'package:password_manager/services/section_service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  late Database db;

  Future<void> init() async {
    final path = join(await getDatabasesPath(), 'password.db');
    db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> close() async {
    await db.close();
  }

  Future<void> delete() async {
    await db.delete(PasswordService.tableName);
    await db.delete(SectionService.tableName);
  }

  Future<void> _onCreate(a, e) async {
    await a.execute('''
      CREATE TABLE passwords (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        image TEXT,
        section_id INTEGER,
        FOREIGN KEY (section_id) REFERENCES sections (id)
      );
    ''');

    await a.execute('''
      CREATE TABLE sections (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL
      );
    ''');
  }
}
