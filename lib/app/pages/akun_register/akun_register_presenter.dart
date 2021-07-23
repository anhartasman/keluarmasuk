import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:keluarmasuk/domain/repositories/UserRepository.dart';
import 'package:keluarmasuk/domain/usecases/user/UserRegisterUseCase.dart';

import 'package:keluarmasuk/domain/usecases/user/UserRegisterUseCase.dart';
class akun_register_presenter extends Presenter {
  
  UserRepository _UserRepository;
  //auto_darttecture_class_var_declaration
//startPresenterUseCaseVarDeclarationForUserRegisterUseCase
late Function ListenUseCaseUserRegisterUseCaseOnError;
late Function ListenUseCaseUserRegisterUseCaseOnNext;
late Function ListenUseCaseUserRegisterUseCaseOnComplete;
UserRegisterUseCase? _UserRegisterUseCase;
//endPresenterUseCaseVarDeclarationForUserRegisterUseCase
  akun_register_presenter(
    this._UserRepository,
    ) {
    //auto_darttecture_usecase_initialize_repo
//start_usecase_initialize_repo_forUserRegisterUseCase
_UserRegisterUseCase = UserRegisterUseCase(_UserRepository);
//end_usecase_initialize_repo_forUserRegisterUseCase
  }
  void dispose() {
    //auto_darttecture_usecase_dispose
_UserRegisterUseCase?.dispose();
      }
//auto_darttecture_class_body
//startFunctionCallUserRegisterUseCase
void callUserRegisterUseCase(String name,String email, String password) {
  print("eksekusi UserRegisterUseCase");
  _UserRegisterUseCase?.execute(_UserRegisterUseCaseObserver(this), UserRegisterUseCaseParams(name,email,password));
}
//stopFunctionCallUserRegisterUseCase

}
//auto_darttecture_class_outside
//startPresenterObserverUseCaseUserRegisterUseCase
class _UserRegisterUseCaseObserver implements Observer<UserAplikasi> {
  // The above presenter
  akun_register_presenter _akun_register_presenter;
  _UserRegisterUseCaseObserver(this._akun_register_presenter);
  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnNext !=
        null) {
      _akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnNext(the_value);
    }
  }
  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnComplete !=
        null) {
      _akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnComplete();
    }
  }
  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnError !=
        null) {
      _akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnError(e);
    }
  }
}
//endPresenterObserverUseCaseUserRegisterUseCase

