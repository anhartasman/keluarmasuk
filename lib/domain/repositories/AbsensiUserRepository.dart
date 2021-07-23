import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/FilterAbsensi.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/ResponGlobal.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';

abstract class AbsensiUserRepository {
  Future<List<AbsensiUser>> getAbsensiUserList(
      UserAplikasi the_user, FilterAbsensi theFilter);
  Future<ResponGlobal<AbsensiUser>> getCurrentAbsensi(UserAplikasi the_user);
  Future<Respon> insertData(UserAplikasi the_user, IsiFormAbsensi isiForm);
  Future<Respon> toggleAbsen(UserAplikasi the_user);
}
