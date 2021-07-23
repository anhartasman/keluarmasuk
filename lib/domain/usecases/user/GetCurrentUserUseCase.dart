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
class GetCurrentUserUseCase
    extends CompletableUseCase<GetCurrentUserUseCaseParams> {
  UserRepository _UserRepository;
  GetCurrentUserUseCase(
    this._UserRepository,
  );

  @override
  Future<Stream<UserAplikasi>> buildUseCaseStream(
      GetCurrentUserUseCaseParams? params) async {
    final StreamController<UserAplikasi> controller = StreamController();
    try {
      var respon_current_user =
          await _UserRepository.getUserAccount(new ViewUserSetting());
      if (!respon_current_user.success) {
        throw (respon_current_user.error_msg);
      }
      controller.add(respon_current_user.the_respon!);
      logger.finest('GetCurrentUserUseCase successful.');
      controller.close();
    } catch (e) {
      print(e);
      logger.severe('GetCurrentUserUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetCurrentUserUseCaseParams {
  GetCurrentUserUseCaseParams();
}
