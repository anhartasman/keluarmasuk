import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:keluarmasuk/domain/repositories/UserRepository.dart';
import 'package:keluarmasuk/domain/usecases/user/UserLoginUseCase.dart';

import 'package:keluarmasuk/domain/usecases/user/UserLoginUseCase.dart';
class akun_login_presenter extends Presenter {
  
  UserRepository _UserRepository;
  //auto_darttecture_class_var_declaration
//startPresenterUseCaseVarDeclarationForUserLoginUseCase
late Function ListenUseCaseUserLoginUseCaseOnError;
late Function ListenUseCaseUserLoginUseCaseOnNext;
late Function ListenUseCaseUserLoginUseCaseOnComplete;
UserLoginUseCase? _UserLoginUseCase;
//endPresenterUseCaseVarDeclarationForUserLoginUseCase
  akun_login_presenter(
    this._UserRepository,
    ) {
    //auto_darttecture_usecase_initialize_repo
//start_usecase_initialize_repo_forUserLoginUseCase
_UserLoginUseCase = UserLoginUseCase(_UserRepository);
//end_usecase_initialize_repo_forUserLoginUseCase
  }
  void dispose() {
    //auto_darttecture_usecase_dispose
_UserLoginUseCase?.dispose();
      }
//auto_darttecture_class_body
//startFunctionCallUserLoginUseCase
void callUserLoginUseCase(String email, String password) {
  print("eksekusi UserLoginUseCase");
  _UserLoginUseCase?.execute(_UserLoginUseCaseObserver(this), UserLoginUseCaseParams(email,password));
}
//stopFunctionCallUserLoginUseCase

}
//auto_darttecture_class_outside
//startPresenterObserverUseCaseUserLoginUseCase
class _UserLoginUseCaseObserver implements Observer<UserAplikasi> {
  // The above presenter
  akun_login_presenter _akun_login_presenter;
  _UserLoginUseCaseObserver(this._akun_login_presenter);
  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_akun_login_presenter.ListenUseCaseUserLoginUseCaseOnNext !=
        null) {
      _akun_login_presenter.ListenUseCaseUserLoginUseCaseOnNext(the_value);
    }
  }
  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_akun_login_presenter.ListenUseCaseUserLoginUseCaseOnComplete !=
        null) {
      _akun_login_presenter.ListenUseCaseUserLoginUseCaseOnComplete();
    }
  }
  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_akun_login_presenter.ListenUseCaseUserLoginUseCaseOnError !=
        null) {
      _akun_login_presenter.ListenUseCaseUserLoginUseCaseOnError(e);
    }
  }
}
//endPresenterObserverUseCaseUserLoginUseCase

