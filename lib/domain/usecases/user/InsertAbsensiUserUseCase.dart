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
class InsertAbsensiUserUseCase
    extends CompletableUseCase<InsertAbsensiUserUseCaseParams> {
  AbsensiUserRepository _AbsensiUserRepository;
  
  UserRepository _UserRepository;
  InsertAbsensiUserUseCase(this._AbsensiUserRepository, this._UserRepository,);

  @override
  Future<Stream<Respon>> buildUseCaseStream(
      InsertAbsensiUserUseCaseParams? params) async {
    final StreamController<Respon> controller = StreamController();
    try {
      var respon_current_user =
          await _UserRepository.getUserAccount(new ViewUserSetting());
      if (!respon_current_user.success) {
        throw (respon_current_user.error_msg);
      }
      var the_current_user = respon_current_user.the_respon;
      _AbsensiUserRepository.insertData(the_current_user!, params!.isiForm).then((theRespon){

        controller.add(theRespon);
       
        logger.finest('InsertAbsensiUserUseCase successful.');
        controller.close();
      });
   
    } catch (e) {
      print(e);
      logger.severe('InsertAbsensiUserUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class InsertAbsensiUserUseCaseParams {
  IsiFormAbsensi isiForm;
  InsertAbsensiUserUseCaseParams(this.isiForm);
}
