import 'dart:async';
import 'dart:math';

import 'package:keluarmasuk/data/database/queries/AbsensiUserQuery.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';

import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import '../DbHelper.dart';

/// `DataProdukRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `RumahPlong`.
class DataAbsensiUserRepository implements AbsensiUserRepository {
  Future<List<AbsensiUser>> getAbsensiUserList(
      UserAplikasi the_user) async {
    //return Future.value(kContacts);
    List<AbsensiUser> theRespon = [];

    return Future.value(theRespon);
  }
  Future<Respon> insertData(
      UserAplikasi the_user,IsiFormAbsensi isiForm) async {
  
    isiForm.userId=the_user.id;
final DbHelper _helper = new DbHelper();
final theRespon = _helper.insertAbsensiUser(isiForm);
    return Future.value(theRespon);
  }
}
