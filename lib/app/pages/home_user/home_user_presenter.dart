import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:keluarmasuk/domain/repositories/UserRepository.dart';
import 'package:keluarmasuk/domain/usecases/user/GetCurrentUserUseCase.dart';
import 'package:keluarmasuk/domain/usecases/user/UserLogoutUseCase.dart';

import 'package:keluarmasuk/domain/usecases/user/UserLogoutUseCase.dart';

class home_user_presenter extends Presenter {
  UserRepository _UserRepository;
  //auto_darttecture_class_var_declaration
//startPresenterUseCaseVarDeclarationForUserLogoutUseCase
  late Function ListenUseCaseUserLogoutUseCaseOnError;
  late Function ListenUseCaseUserLogoutUseCaseOnNext;
  late Function ListenUseCaseUserLogoutUseCaseOnComplete;
  UserLogoutUseCase? _UserLogoutUseCase;
//endPresenterUseCaseVarDeclarationForUserLogoutUseCase
  //startPresenterUseCaseVarDeclarationForGetCurrentUserUseCase
  late Function ListenUseCaseGetCurrentUserUseCaseOnError;
  late Function ListenUseCaseGetCurrentUserUseCaseOnNext;
  late Function ListenUseCaseGetCurrentUserUseCaseOnComplete;
  GetCurrentUserUseCase? _GetCurrentUserUseCase;
//endPresenterUseCaseVarDeclarationForGetCurrentUserUseCase
  home_user_presenter(
    this._UserRepository,
  ) {
    //auto_darttecture_usecase_initialize_repo
//start_usecase_initialize_repo_forUserLogoutUseCase
    _UserLogoutUseCase = UserLogoutUseCase(_UserRepository);
//end_usecase_initialize_repo_forUserLogoutUseCase
    //start_usecase_initialize_repo_forGetCurrentUserUseCase
    _GetCurrentUserUseCase = GetCurrentUserUseCase(_UserRepository);
//end_usecase_initialize_repo_forGetCurrentUserUseCase
  }
  void dispose() {
    //auto_darttecture_usecase_dispose
    _UserLogoutUseCase?.dispose();
    _GetCurrentUserUseCase?.dispose();
  }

//auto_darttecture_class_body
//startFunctionCallUserLogoutUseCase
  void callUserLogoutUseCase() {
    print("eksekusi UserLogoutUseCase");
    _UserLogoutUseCase?.execute(
        _UserLogoutUseCaseObserver(this), UserLogoutUseCaseParams());
  }

//stopFunctionCallUserLogoutUseCase
//startFunctionCallGetCurrentUserUseCase
  void callGetCurrentUserUseCase() {
    print("eksekusi GetCurrentUserUseCase");
    _GetCurrentUserUseCase?.execute(
        _GetCurrentUserUseCaseObserver(this), GetCurrentUserUseCaseParams());
  }
//stopFunctionCallGetCurrentUserUseCase

}

//auto_darttecture_class_outside
//startPresenterObserverUseCaseUserLogoutUseCase
class _UserLogoutUseCaseObserver implements Observer<Respon> {
  // The above presenter
  home_user_presenter _home_user_presenter;
  _UserLogoutUseCaseObserver(this._home_user_presenter);

  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_home_user_presenter.ListenUseCaseUserLogoutUseCaseOnNext != null) {
      _home_user_presenter.ListenUseCaseUserLogoutUseCaseOnNext(the_value);
    }
  }

  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_home_user_presenter.ListenUseCaseUserLogoutUseCaseOnComplete != null) {
      _home_user_presenter.ListenUseCaseUserLogoutUseCaseOnComplete();
    }
  }

  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_home_user_presenter.ListenUseCaseUserLogoutUseCaseOnError != null) {
      _home_user_presenter.ListenUseCaseUserLogoutUseCaseOnError(e);
    }
  }
}

//endPresenterObserverUseCaseUserLogoutUseCase
//startPresenterObserverUseCaseGetCurrentUserUseCase
class _GetCurrentUserUseCaseObserver implements Observer<UserAplikasi> {
  // The above presenter
  home_user_presenter _home_user_presenter;
  _GetCurrentUserUseCaseObserver(this._home_user_presenter);

  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_home_user_presenter.ListenUseCaseGetCurrentUserUseCaseOnNext != null) {
      _home_user_presenter.ListenUseCaseGetCurrentUserUseCaseOnNext(the_value);
    }
  }

  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_home_user_presenter.ListenUseCaseGetCurrentUserUseCaseOnComplete !=
        null) {
      _home_user_presenter.ListenUseCaseGetCurrentUserUseCaseOnComplete();
    }
  }

  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_home_user_presenter.ListenUseCaseGetCurrentUserUseCaseOnError !=
        null) {
      _home_user_presenter.ListenUseCaseGetCurrentUserUseCaseOnError(e);
    }
  }
}
//endPresenterObserverUseCaseGetCurrentUserUseCase
