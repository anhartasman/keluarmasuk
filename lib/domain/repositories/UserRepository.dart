// Shady Boukhary

import 'dart:async';
import 'dart:io';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/ResponGlobal.dart';

import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/entities/ViewUserSetting.dart';

abstract class UserRepository {
  Future<ResponGlobal<UserAplikasi>> getUserAccount(
      ViewUserSetting viewSetting);
  Future<ResponGlobal<UserAplikasi>> loginUserAccount(
      String email, String password);
  Future<Respon> logout();
  Future<ResponGlobal<UserAplikasi>> registerUserAccount(
      String name, String email, String password);
}
