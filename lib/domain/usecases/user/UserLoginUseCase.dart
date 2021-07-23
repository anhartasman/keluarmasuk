import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

/// Retrieves the current authentication status of the [UserAplikasi]
class UserLoginUseCase
    extends CompletableUseCase<UserLoginUseCaseParams> {
  UserRepository _UserRepository;
  UserLoginUseCase(
      this._UserRepository);

  @override
  Future<Stream<UserAplikasi>> buildUseCaseStream(
      UserLoginUseCaseParams? params) async {
    final StreamController<UserAplikasi> controller = StreamController();
    try {
      print("ceraceracera");
      // User the_user = (await _UserRepository.getUserAccount()).the_user;
      print("popopopop");
      final the_respon = await _UserRepository.loginUserAccount(params!.email,params.password);
      if (!the_respon.success) {
        throw (the_respon.error_msg);
      }
      
      controller.add(the_respon.the_respon!);
      logger.finest('UserLoginUseCase successful.');
      controller.close();
    } catch (e) {
      print(e);
      logger.severe('UserLoginUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class UserLoginUseCaseParams {
  String email;
  String password;
  UserLoginUseCaseParams(this.email,this.password);
}
