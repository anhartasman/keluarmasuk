import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/ResponGlobal.dart';

import 'package:keluarmasuk/domain/entities/ViewUserSetting.dart';

import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

/// Retrieves the current authentication status of the [User]
class ToggleAbsensiUserUseCase
    extends CompletableUseCase<ToggleAbsensiUserUseCaseParams> {
  AbsensiUserRepository _AbsensiUserRepository;

  UserRepository _UserRepository;
  ToggleAbsensiUserUseCase(
    this._AbsensiUserRepository,
    this._UserRepository,
  );

  @override
  Future<Stream<Respon>> buildUseCaseStream(
      ToggleAbsensiUserUseCaseParams? params) async {
    final StreamController<Respon> controller = StreamController();
    try {
      var respon_current_user =
          await _UserRepository.getUserAccount(new ViewUserSetting());
      if (!respon_current_user.success) {
        throw (respon_current_user.error_msg);
      }
      var the_current_user = respon_current_user.the_respon;
      _AbsensiUserRepository.toggleAbsen(the_current_user!).then((theRespon) {
        controller.add(theRespon);

        logger.finest('ToggleAbsensiUserUseCase successful.');
        controller.close();
      });
    } catch (e) {
      print(e);
      logger.severe('ToggleAbsensiUserUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class ToggleAbsensiUserUseCaseParams {
  ToggleAbsensiUserUseCaseParams();
}
