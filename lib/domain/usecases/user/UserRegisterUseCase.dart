import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

/// Retrieves the current authentication status of the [UserAplikasi]
class UserRegisterUseCase
    extends CompletableUseCase<UserRegisterUseCaseParams> {
  UserRepository _UserRepository;
  UserRegisterUseCase(
      this._UserRepository);

  @override
  Future<Stream<UserAplikasi>> buildUseCaseStream(
      UserRegisterUseCaseParams? params) async {
    final StreamController<UserAplikasi> controller = StreamController();
    try {
      print("ceraceracera");
      // User the_user = (await _UserRepository.getUserAccount()).the_user;
      print("popopopop");
      final the_respon = await _UserRepository.registerUserAccount(params!.name,params.email,params.password);
      if (!the_respon.success) {
        throw ("${the_respon.error_msg}");
      }
      
      controller.add(the_respon.the_respon!);
      logger.finest('UserRegisterUseCase successful.');
      controller.close();
    } catch (e) {
      print(e);
      logger.severe('UserRegisterUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class UserRegisterUseCaseParams {
  String name;
  String email;
  String password;
  UserRegisterUseCaseParams(this.name,this.email,this.password);
}
