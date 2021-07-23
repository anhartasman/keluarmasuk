import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:keluarmasuk/domain/repositories/UserRepository.dart';
import 'package:keluarmasuk/domain/usecases/user/GetCurrentAbsensiUserUseCase.dart';
import 'package:keluarmasuk/domain/usecases/user/ToggleAbsensiUserUseCase.dart';

import 'package:keluarmasuk/domain/usecases/user/UserLoginUseCase.dart';

class form_absensi_presenter extends Presenter {
  UserRepository _UserRepository;
  AbsensiUserRepository _AbsensiUserRepository;
  //auto_darttecture_class_var_declaration
//startPresenterUseCaseVarDeclarationForToggleAbsensiUserUseCase
  late Function ListenUseCaseToggleAbsensiUserUseCaseOnError;
  late Function ListenUseCaseToggleAbsensiUserUseCaseOnNext;
  late Function ListenUseCaseToggleAbsensiUserUseCaseOnComplete;
  ToggleAbsensiUserUseCase? _ToggleAbsensiUserUseCase;
//endPresenterUseCaseVarDeclarationForToggleAbsensiUserUseCase
  //startPresenterUseCaseVarDeclarationForGetCurrentAbsensiUserUseCase
  late Function ListenUseCaseGetCurrentAbsensiUserUseCaseOnError;
  late Function ListenUseCaseGetCurrentAbsensiUserUseCaseOnNext;
  late Function ListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete;
  GetCurrentAbsensiUserUseCase? _GetCurrentAbsensiUserUseCase;
//endPresenterUseCaseVarDeclarationForGetCurrentAbsensiUserUseCase
  form_absensi_presenter(
    this._AbsensiUserRepository,
    this._UserRepository,
  ) {
    //auto_darttecture_usecase_initialize_repo
//start_usecase_initialize_repo_forToggleAbsensiUserUseCase
    _ToggleAbsensiUserUseCase =
        ToggleAbsensiUserUseCase(_AbsensiUserRepository, _UserRepository);
//end_usecase_initialize_repo_forToggleAbsensiUserUseCase
    //start_usecase_initialize_repo_forGetCurrentAbsensiUserUseCase
    _GetCurrentAbsensiUserUseCase =
        GetCurrentAbsensiUserUseCase(_AbsensiUserRepository, _UserRepository);
//end_usecase_initialize_repo_forGetCurrentAbsensiUserUseCase
  }
  void dispose() {
    //auto_darttecture_usecase_dispose
    _ToggleAbsensiUserUseCase?.dispose();
    _GetCurrentAbsensiUserUseCase?.dispose();
  }

//auto_darttecture_class_body
//startFunctionCallToggleAbsensiUserUseCase
  void callToggleAbsensiUserUseCase() {
    print("eksekusi ToggleAbsensiUserUseCase");
    _ToggleAbsensiUserUseCase?.execute(_ToggleAbsensiUserUseCaseObserver(this),
        ToggleAbsensiUserUseCaseParams());
  }
//stopFunctionCallToggleAbsensiUserUseCase

//startFunctionCallGetCurrentAbsensiUserUseCase
  void callGetCurrentAbsensiUserUseCase() {
    print("eksekusi GetCurrentAbsensiUserUseCase");
    _GetCurrentAbsensiUserUseCase?.execute(
        _GetCurrentAbsensiUserUseCaseObserver(this),
        GetCurrentAbsensiUserUseCaseParams());
  }
//stopFunctionCallGetCurrentAbsensiUserUseCase

}

//auto_darttecture_class_outside
//startPresenterObserverUseCaseToggleAbsensiUserUseCase
class _ToggleAbsensiUserUseCaseObserver implements Observer<Respon> {
  // The above presenter
  form_absensi_presenter _form_absensi_presenter;
  _ToggleAbsensiUserUseCaseObserver(this._form_absensi_presenter);

  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnNext !=
        null) {
      _form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnNext(
          the_value);
    }
  }

  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_form_absensi_presenter
            .ListenUseCaseToggleAbsensiUserUseCaseOnComplete !=
        null) {
      _form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnComplete();
    }
  }

  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnError !=
        null) {
      _form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnError(e);
    }
  }
}

//endPresenterObserverUseCaseToggleAbsensiUserUseCase
//startPresenterObserverUseCaseGetCurrentAbsensiUserUseCase
class _GetCurrentAbsensiUserUseCaseObserver implements Observer<AbsensiUser> {
  // The above presenter
  form_absensi_presenter _form_absensi_presenter;
  _GetCurrentAbsensiUserUseCaseObserver(this._form_absensi_presenter);

  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_form_absensi_presenter
            .ListenUseCaseGetCurrentAbsensiUserUseCaseOnNext !=
        null) {
      _form_absensi_presenter.ListenUseCaseGetCurrentAbsensiUserUseCaseOnNext(
          the_value);
    }
  }

  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_form_absensi_presenter
            .ListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete !=
        null) {
      _form_absensi_presenter
          .ListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete();
    }
  }

  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_form_absensi_presenter
            .ListenUseCaseGetCurrentAbsensiUserUseCaseOnError !=
        null) {
      _form_absensi_presenter.ListenUseCaseGetCurrentAbsensiUserUseCaseOnError(
          e);
    }
  }
}
//endPresenterObserverUseCaseGetCurrentAbsensiUserUseCase
