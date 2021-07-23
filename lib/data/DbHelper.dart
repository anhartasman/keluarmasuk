import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/ResponGlobal.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

import 'database/queries/AbsensiUserQuery.dart';
import 'database/queries/UserQuery.dart';

class DbHelper {
  //membuat method singleton
  static DbHelper _dbHelper = DbHelper._singleton();

  factory DbHelper() {
    return _dbHelper;
  }

  DbHelper._singleton();

  //baris terakhir singleton

  final tables = [
    UserQuery.CREATE_TABLE,
    AbsensiUserQuery.CREATE_TABLE
  ]; // membuat daftar table yang akan dibuat

  Future<Database> openDB() async {
    final dbPath = await sqlite.getDatabasesPath();
    return sqlite.openDatabase(path.join(dbPath, 'thengoding.db'),
        onUpgrade: (db, oldVersion, newVersion) {
      tables.forEach((table) async {
        await db.execute("DROP TABLE ${table}");
        await db.execute(table).then((value) {
          print("berashil ");
        }).catchError((err) {
          print("errornya ${err.toString()}");
        });
      });
    }, onCreate: (db, version) {
      tables.forEach((table) async {
        await db.execute(table).then((value) {
          print("berashil ");
        }).catchError((err) {
          print("errornya ${err.toString()}");
        });
      });
      print('Table Created');
    }, version: 3);
  }

  Future<Respon> insertAbsensiUser(IsiFormAbsensi isiForm) async {
    final db = await openDB();

    String whereString = 'sedanngIn = 1 AND userId = ${isiForm.userId}';

    List<Map<String, Object?>> result =
        await db.query(AbsensiUserQuery.TABLE_NAME, where: whereString);
    bool dapatIn = false;
    String absenId = "";
    if (result.length > 0) {
      dapatIn = true;
      absenId = result[0]["id"] as String;
    }
    final waktuSekarang = DateTime.now();

    var theRespon = new Respon();

    if (dapatIn) {
      var oldResult = result[0];
      oldResult["sedangIn"] = 0;
      oldResult["absenOut"] = waktuSekarang.millisecondsSinceEpoch;
      await db.update(AbsensiUserQuery.TABLE_NAME, oldResult,
          where: whereString);
    } else {
      Map<String, Object?> newData = {
        "userId": isiForm.userId,
        "absenIn": waktuSekarang.millisecondsSinceEpoch,
        "absenOut": null,
        "sedangIn": 1
      };
      await db.insert(AbsensiUserQuery.TABLE_NAME, newData,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return theRespon;
  }

  Future<ResponGlobal<UserAplikasi>> login(
      String email, String password) async {
    final db = await openDB();
    var theRespon = new ResponGlobal<UserAplikasi>();
    try {
      String whereString = 'email = "${email}" AND password = "${password}"';

      List<Map<String, Object?>> result =
          await db.query(UserQuery.TABLE_NAME, where: whereString);

      if (result.length > 0) {
        var theOne = Map.of(result[0]);
        theOne.update("id", (value) => theOne["id"].toString());

        theRespon.the_respon = UserAplikasi.fromMap(theOne);

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("currentAccount", theRespon.the_respon!.toJson());
      } else {
        throw ("Email ${email} not found");
      }
    } catch (error) {
      theRespon.success = false;
      theRespon.error_msg = error.toString();
    }

    return theRespon;
  }

  Future<ResponGlobal<UserAplikasi>> register(
      String name, String email, String password) async {
    final db = await openDB();
    var theRespon = new ResponGlobal<UserAplikasi>();
    try {
      String whereString = 'email = "${email}"';

      List<Map<String, Object?>> result =
          await db.query(UserQuery.TABLE_NAME, where: whereString);

      if (result.length > 0) {
        throw ("Email ${email} already exist");
      } else {
        await db.insert(UserQuery.TABLE_NAME, {
          "name": name,
          "email": email,
          "password": password,
        }).catchError((e) {
          throw (e.toString());
        });

        theRespon.the_respon =
            UserAplikasi(id: "", name: name, email: email, password: password);
      }
    } catch (error) {
      print("Gagal register " + error.toString());
      theRespon.success = false;
      theRespon.error_msg = error.toString();
    }

    return theRespon;
  }

  Future<ResponGlobal<AbsensiUser>> getCurrentAbsensi(
      UserAplikasi the_user) async {
    final db = await openDB();
    var theRespon = new ResponGlobal<AbsensiUser>();
    try {
      String whereAbsenString = 'userId = ${the_user.id} AND sedangIn = 1';
      String whereUserString = 'id = ${the_user.id}';

      List<Map<String, Object?>> result =
          await db.query(AbsensiUserQuery.TABLE_NAME, where: whereAbsenString);

      if (result.length == 0) {
        throw ("Absen not found");
      }
      theRespon.the_respon = AbsensiUser.fromMap(result[0]);

      List<Map<String, Object?>> resultUser =
          await db.query(UserQuery.TABLE_NAME, where: whereUserString);

      if (resultUser.length == 0) {
        throw ("User with id ${the_user.id} not found");
      }
      theRespon.the_respon!.theUser = UserAplikasi.fromMap(resultUser[0]);
    } catch (error) {
      print("Gagal getCurrentAbsensi " + error.toString());
      theRespon.success = false;
      theRespon.error_msg = error.toString();
    }

    return theRespon;
  }

  Future<List<AbsensiUser>> getListAbsensi(UserAplikasi the_user) async {
    final db = await openDB();
    List<AbsensiUser> theRespon = [];
    try {
      String whereAbsenString = 'userId = ${the_user.id}';
      String whereUserString = 'id = ${the_user.id}';

      List<Map<String, Object?>> result =
          await db.query(AbsensiUserQuery.TABLE_NAME, where: whereAbsenString);

      if (result.length > 0) {
        for (var theResult in result) {
          var rowAbsen = AbsensiUser.fromMap(theResult);
          var resultUser =
              await db.query(UserQuery.TABLE_NAME, where: whereUserString);

          if (resultUser.length > 0) {
            rowAbsen.theUser = UserAplikasi.fromMap(resultUser[0]);
          }
          theRespon.add(rowAbsen);
        }
      }
    } catch (error) {
      print("Gagal getListAbsensi " + error.toString());
    }

    return theRespon;
  }

  insert(String table, Map<String, Object> data) {
    openDB().then((db) {
      db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    }).catchError((err) {
      print("error $err");
    });
  }

  Future<List> getData(String tableName) async {
    final db = await openDB();
    var result = await db.query(tableName);
    return result.toList();
  }
}
