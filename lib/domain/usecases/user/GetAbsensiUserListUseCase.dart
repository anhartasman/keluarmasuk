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
class GetAbsensiUserListUseCase
    extends CompletableUseCase<GetAbsensiUserListUseCaseParams> {
  AbsensiUserRepository _AbsensiUserRepository;
  
  UserRepository _UserRepository;
  GetAbsensiUserListUseCase(this._AbsensiUserRepository, this._UserRepository,);

  @override
  Future<Stream<AbsensiUser>> buildUseCaseStream(
      GetAbsensiUserListUseCaseParams? params) async {
    final StreamController<AbsensiUser> controller = StreamController();
    try {
      var respon_current_user =
          await _UserRepository.getUserAccount(new ViewUserSetting());
      if (!respon_current_user.success) {
        throw (respon_current_user.error_msg);
      }
      var the_current_user = respon_current_user.the_respon;

      _AbsensiUserRepository.getAbsensiUserList(the_current_user!)
          .then((rumah_list) {
        print("get " + rumah_list.length.toString() + " AbsensiUser");

        rumah_list.forEach((theRumah) {
          controller.add(theRumah);
        });
        logger.finest('GetAbsensiUserListUseCase successful.');
        controller.close();
      });
    } catch (e) {
      print(e);
      logger.severe('GetAbsensiUserListUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetAbsensiUserListUseCaseParams {
  GetAbsensiUserListUseCaseParams();
}
