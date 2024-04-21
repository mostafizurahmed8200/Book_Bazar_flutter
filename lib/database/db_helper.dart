import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/loginflag_model.dart';

class DBHelper {
  //Create DB and Table
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'BookBazar.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE LoginTbl(loginFlag TEXT)",
        );
      },
      version: 1,
    );
  }

  //Insert DB
  static Future<void> insertSaladTable(LoginSqlModel loginSqlModel) async {
    final Database db = await database();

    await db.insert(
      'LoginTbl',
      loginSqlModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<String> getLoginFlag() async {
    final Database db = await database();
    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT  * FROM LoginTbl');

    if (result.isNotEmpty) {
      String flag = result[0]['loginFlag'];

      return flag;
    } else {
      // If no rows are found, return a default value or handle the case accordingly
      return 'DefaultFlag';
    }
  }

  //Delete Item from Table--
  static Future<void> deleteLoginFlag() async {
    final Database db = await database();
    await db.delete('LoginTbl');
  }
}
