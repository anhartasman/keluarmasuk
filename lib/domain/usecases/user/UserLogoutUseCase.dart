import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

/// Retrieves the current authentication status of the [UserAplikasi]
class UserLogoutUseCase extends CompletableUseCase<UserLogoutUseCaseParams> {
  UserRepository _UserRepository;
  UserLogoutUseCase(this._UserRepository);

  @override
  Future<Stream<Respon>> buildUseCaseStream(
      UserLogoutUseCaseParams? params) async {
    final StreamController<Respon> controller = StreamController();
    try {
      print("ceraceracera");
      // User the_user = (await _UserRepository.getUserAccount()).the_user;
      print("popopopop");
      final the_respon = await _UserRepository.logout();
      if (!the_respon.success) {
        throw (the_respon.error_msg);
      }

      controller.add(the_respon);
      logger.finest('UserLogoutUseCase successful.');
      controller.close();
    } catch (e) {
      print(e);
      logger.severe('UserLogoutUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class UserLogoutUseCaseParams {
  UserLogoutUseCaseParams();
}
