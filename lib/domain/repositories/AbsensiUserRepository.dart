import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/ResponGlobal.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';

abstract class AbsensiUserRepository {
  Future<List<AbsensiUser>> getAbsensiUserList(UserAplikasi the_user);
  Future<ResponGlobal<AbsensiUser>> getCurrentAbsensi(UserAplikasi the_user);
  Future<Respon> insertData(UserAplikasi the_user,IsiFormAbsensi isiForm);
}
