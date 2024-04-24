import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/loginflag_model.dart';

class DBHelper {
  static const String loginFlagTbl = 'LoginFlagTbl';
  static const String userDatatbl = 'UserDataTbl';
  static const String addresstbl = 'AddressTbl';

  //Create DB and Table
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'BookBazar.db'),
      onCreate: (db, version) {
        //LoginTable
        db.execute(
          "CREATE TABLE ${loginFlagTbl}(loginFlag TEXT)",
        );

        //User Data Table
        db.execute(
          "CREATE TABLE ${userDatatbl}(id INTEGER PRIMARY KEY AUTOINCREMENT ,name TEXT, email TEXT, phone TEXT, password TEXT, image_path TEXT)",
        );

        //User Data Table
        db.execute(
          "CREATE TABLE ${addresstbl}(id INTEGER PRIMARY KEY AUTOINCREMENT ,"
          " name TEXT,"
          " email TEXT,"
          " phone TEXT,"
          " pincode TEXT,"
          " state TEXT,"
          " city TEXT,"
          " house_number TEXT,"
          " landmark TEXT,"
          " chip_data TEXT)",
        );
      },
      version: 1,
    );
  }

  //Insert DB
  static Future<void> insertLoginFlagTable(LoginSqlModel loginSqlModel) async {
    final Database db = await database();

    await db.insert(
      loginFlagTbl,
      loginSqlModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Login Flag
  static Future<String> getLoginFlag() async {
    final Database db = await database();
    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT  * FROM ${loginFlagTbl}');

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
    await db.delete(loginFlagTbl);
  }

  //User Data--->
  //Insert User Data Table
  static Future<void> insertOrUpdateUserDataTable(
    String name,
    String email,
    String phone,
    String image_path,
  ) async {
    final Database db = await database();

    // Check if data already exists based on email or phone number
    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT * FROM $userDatatbl',
    );

    if (result.isEmpty) {
      // Table is empty, perform insert
      await db.insert(
        userDatatbl,
        {
          'name': name,
          'email': email,
          'phone': phone,
          'image_path': image_path,
        },
      );
    } else {
      // Data exists, perform update
      await db.update(
        userDatatbl,
        {
          'name': name,
          'email': email,
          'phone': phone,
          'image_path': image_path,
        },
      );
    }
  }

// Retrieve user data from the UserData table
  static Future<Map<String, dynamic>?> getUserData() async {
    final Database db = await database();
    final List<Map<String, dynamic>> result = await db.query(userDatatbl);

    if (result.isNotEmpty) {
      // If there are rows in the result, return the first row
      return result[0];
    } else {
      // If no rows are found, return null or handle the case accordingly
      return null;
    }
  }

  // Update user data in the database
  static Future<void> updateUserDataTable(
      String name, String email, String phone) async {
    final Database db = await database();

    await db.update(
      userDatatbl,
      {
        'name': name,
        'email': email,
        'phone': phone,
      },
    );
  }

  //Address Feild--
//Insert-
  static Future<void> insertOrUpdateAddressTable(
    String name,
    String email,
    String phone,
    String pincode,
    String state,
    String city,
    String houseNumber,
    String landmark,
    String chipData,
  ) async {
    final Database db = await database();

    // Check if data already exists based on email or phone number
    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT * FROM $addresstbl WHERE email = ? OR phone = ?',
      [email, phone],
    );

    if (result.isNotEmpty) {
      // Data already exists, perform update
      await db.update(
        addresstbl,
        {
          'name': name,
          'email': email,
          'phone': phone,
          'pincode': pincode,
          'state': state,
          'city': city,
          'house_number': houseNumber,
          'landmark': landmark,
          'chip_data': chipData,
        },
        where: 'email = ? OR phone = ?',
        whereArgs: [email, phone],
      );
    } else {
      // Data doesn't exist, perform insert
      await db.insert(
        addresstbl,
        {
          'name': name,
          'email': email,
          'phone': phone,
          'pincode': pincode,
          'state': state,
          'city': city,
          'house_number': houseNumber,
          'landmark': landmark,
          'chip_data': chipData,
        },
      );
    }
  }

  //Retraive address Data
  static Future<Map<String, dynamic>?> getAddressData() async {
    final Database db = await database();
    final List<Map<String, dynamic>> result = await db.query(addresstbl);

    if (result.isNotEmpty) {
      // If there are rows in the result, return the first row
      return result[0];
    } else {
      // If no rows are found, return null or handle the case accordingly
      return null;
    }
  }
}
