import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/ResponGlobal.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
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
        onCreate: (db, version) {
      tables.forEach((table) async {
        await db.execute(table).then((value) {
          print("berashil ");
        }).catchError((err) {
          print("errornya ${err.toString()}");
        });
      });
      print('Table Created');
    }, version: 1);
  }

  Future<Respon> insertAbsensiUser(IsiFormAbsensi isiForm) async{
      final db = await openDB();

    String whereString = 'sedanngIn = 1 AND userId = ${isiForm.userId}';

    List<Map<String, Object?>> result = await db.query(AbsensiUserQuery.TABLE_NAME,where:whereString);
    bool dapatIn=false;
    String absenId="";
    if(result.length>0){
      dapatIn=true;
      absenId=result[0]["id"] as String;
    }
    final waktuSekarang= DateTime.now();

    var theRespon = new Respon();

    if (dapatIn){
      var oldResult=result[0];
      oldResult["sedangIn"]=0;
      oldResult["absenOut"]=waktuSekarang.millisecondsSinceEpoch;
      await db.update(AbsensiUserQuery.TABLE_NAME, oldResult,where:whereString);
      
    }else{
      Map<String, Object?> newData={
        "userId":isiForm.userId,
        "absenIn":waktuSekarang.millisecondsSinceEpoch,
        "absenOut":null,
        "sedangIn":1
      };
      await db.insert(AbsensiUserQuery.TABLE_NAME, newData, conflictAlgorithm: ConflictAlgorithm.replace);
      
    }
     
    return theRespon;
 
 
  }

  Future<ResponGlobal<UserAplikasi>> login(String email,String password) async{
      final db = await openDB();
    var theRespon = new ResponGlobal<UserAplikasi>();
    try{
      String whereString = 'email = "${email}" AND password = "${password}"';

      List<Map<String, Object?>> result = await db.query(UserQuery.TABLE_NAME,where:whereString);
      
      if(result.length>0){
        theRespon.the_respon=UserAplikasi.fromMap(result[0]);
      }else{
        throw("Email ${email} not found");
      }
    }catch(error){
      theRespon.success=false;
      theRespon.error_msg = error.toString();
    }

    return theRespon;
  }

  Future<ResponGlobal<UserAplikasi>> register(String name, String email,String password) async{
      final db = await openDB();
    var theRespon = new ResponGlobal<UserAplikasi>();
    try{
      String whereString = 'email = "${email}"';

      List<Map<String, Object?>> result = await db.query(UserQuery.TABLE_NAME,where:whereString);
      
      if(result.length>0){
        throw("Email ${email} already exist");
      }else{
        insert(UserQuery.TABLE_NAME,{
          "name":name,
          "email":email,
          "password":password,
        });
      }
    }catch(error){
      theRespon.success=false;
      theRespon.error_msg = error.toString();
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