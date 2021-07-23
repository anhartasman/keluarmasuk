import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:keluarmasuk/domain/repositories/UserRepository.dart';
import 'package:keluarmasuk/domain/usecases/user/GetCurrentUserUseCase.dart';

import 'package:keluarmasuk/domain/usecases/user/GetCurrentUserUseCase.dart';

class splash_presenter extends Presenter {
  UserRepository _UserRepository;
  //auto_darttecture_class_var_declaration
//startPresenterUseCaseVarDeclarationForGetCurrentUserUseCase
  late Function ListenUseCaseGetCurrentUserUseCaseOnError;
  late Function ListenUseCaseGetCurrentUserUseCaseOnNext;
  late Function ListenUseCaseGetCurrentUserUseCaseOnComplete;
  GetCurrentUserUseCase? _GetCurrentUserUseCase;
//endPresenterUseCaseVarDeclarationForGetCurrentUserUseCase
  splash_presenter(
    this._UserRepository,
  ) {
    //auto_darttecture_usecase_initialize_repo
//start_usecase_initialize_repo_forGetCurrentUserUseCase
    _GetCurrentUserUseCase = GetCurrentUserUseCase(_UserRepository);
//end_usecase_initialize_repo_forGetCurrentUserUseCase
  }
  void dispose() {
    //auto_darttecture_usecase_dispose
    _GetCurrentUserUseCase?.dispose();
  }

//auto_darttecture_class_body
//startFunctionCallGetCurrentUserUseCase
  void callGetCurrentUserUseCase() {
    print("eksekusi GetCurrentUserUseCase");
    _GetCurrentUserUseCase?.execute(
        _GetCurrentUserUseCaseObserver(this), GetCurrentUserUseCaseParams());
  }
//stopFunctionCallGetCurrentUserUseCase

}

//auto_darttecture_class_outside
//startPresenterObserverUseCaseGetCurrentUserUseCase
class _GetCurrentUserUseCaseObserver implements Observer<UserAplikasi> {
  // The above presenter
  splash_presenter _splash_presenter;
  _GetCurrentUserUseCaseObserver(this._splash_presenter);

  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnNext != null) {
      _splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnNext(the_value);
    }
  }

  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnComplete !=
        null) {
      _splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnComplete();
    }
  }

  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnError != null) {
      _splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnError(e);
    }
  }
}
//endPresenterObserverUseCaseGetCurrentUserUseCase
