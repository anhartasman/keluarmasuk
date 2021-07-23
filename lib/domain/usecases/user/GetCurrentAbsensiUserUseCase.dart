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
class GetCurrentAbsensiUserUseCase
    extends CompletableUseCase<GetCurrentAbsensiUserUseCaseParams> {
  AbsensiUserRepository _AbsensiUserRepository;
  
  UserRepository _UserRepository;
  GetCurrentAbsensiUserUseCase(this._AbsensiUserRepository, this._UserRepository,);

  @override
  Future<Stream<AbsensiUser>> buildUseCaseStream(
      GetCurrentAbsensiUserUseCaseParams? params) async {
    final StreamController<AbsensiUser> controller = StreamController();
    try {
      var respon_current_user =
          await _UserRepository.getUserAccount(new ViewUserSetting());
      if (!respon_current_user.success) {
        throw (respon_current_user.error_msg);
      }
      var the_current_user = respon_current_user.the_respon;

      var respon_absensi_user =
          await _AbsensiUserRepository.getCurrentAbsensi(the_current_user!);
      
       if (!respon_absensi_user.success) {
        throw (respon_absensi_user.error_msg);
      } 
          controller.add(respon_absensi_user.the_respon!); 
        logger.finest('GetCurrentAbsensiUserUseCase successful.');
        controller.close();
     
     
    } catch (e) {
      print(e);
      logger.severe('GetCurrentAbsensiUserUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetCurrentAbsensiUserUseCaseParams {
  GetCurrentAbsensiUserUseCaseParams();
}
