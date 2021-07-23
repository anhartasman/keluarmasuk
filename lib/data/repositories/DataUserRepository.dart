import 'dart:async';
import 'dart:io';
import 'dart:math';


import 'package:keluarmasuk/domain/entities/Respon.dart';


import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/ResponGlobal.dart';
import 'package:keluarmasuk/domain/entities/ViewUserSetting.dart';
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'package:logging/logging.dart';
// Import the firebase_core plugin




import '../DbHelper.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataUserRepository implements UserRepository {
  late Logger _logger;

  DataUserRepository() {
    _logger = Logger('DataUserRepository');
  }

  Future<ResponGlobal<UserAplikasi>> getUserAccount(
      ViewUserSetting viewSetting) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var respon = new ResponGlobal<UserAplikasi>(
        success: true, the_respon: UserAplikasi());
    try {
      if(preferences.containsKey("currentAccount")){
        final theString=preferences.getString("currentAccount")!;
        respon.the_respon=UserAplikasi.fromJson(theString);
      }else{
        throw("Account not found");
      }
      
    } catch (error) {
      print("rereea");
      //TODO:Perbaiki success
      respon.success = true;
      respon.error_msg = error.toString();
      _logger.warning(error.toString());
    }

    return respon;

    // DatabaseReference _counterRef =
    //     FirebaseDatabase.instance.reference().child('nama');
    // _counterRef.once().then((DataSnapshot snapshot) {
    //   print('Connected to second database and read ${snapshot.value}');
    // });

    // return user;
  }
 
  Future<ResponGlobal<UserAplikasi>> loginUserAccount(
      String email,String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   final DbHelper _helper = new DbHelper();
    var respon = new ResponGlobal<UserAplikasi>(
        success: true, the_respon: UserAplikasi());
    try {
      respon=await _helper.login(email,password);
    } catch (error) {
      print("rereea");
      respon.success = false;
      respon.error_msg = error.toString();
      _logger.warning(error.toString());
    }

    return respon;
  }
 
  Future<ResponGlobal<UserAplikasi>> registerUserAccount(
      String name,String email,String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   final DbHelper _helper = new DbHelper();
    var respon = new ResponGlobal<UserAplikasi>(
        success: true, the_respon: UserAplikasi());
    try {
      respon=await _helper.register(name,email,password);
    } catch (error) {
      print("rereea");
      respon.success = false;
      respon.error_msg = error.toString();
      _logger.warning(error.toString());
    }

    return respon;
  } 
}
