import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

import 'package:keluarmasuk/domain/usecases/user/GetAbsensiUserListUseCase.dart';

class list_absensi_presenter extends Presenter {
  AbsensiUserRepository _AbsensiUserRepository;
  UserRepository _UserRepository;
  //auto_darttecture_class_var_declaration
//startPresenterUseCaseVarDeclarationForGetAbsensiUserListUseCase
  late Function ListenUseCaseGetAbsensiUserListUseCaseOnError;
  late Function ListenUseCaseGetAbsensiUserListUseCaseOnNext;
  late Function ListenUseCaseGetAbsensiUserListUseCaseOnComplete;
  GetAbsensiUserListUseCase? _GetAbsensiUserListUseCase;
//endPresenterUseCaseVarDeclarationForGetAbsensiUserListUseCase
  list_absensi_presenter(
    this._AbsensiUserRepository,
    this._UserRepository,
  ) {
    //auto_darttecture_usecase_initialize_repo
//start_usecase_initialize_repo_forGetAbsensiUserListUseCase
    _GetAbsensiUserListUseCase = GetAbsensiUserListUseCase(
        _AbsensiUserRepository, _UserRepository);
//end_usecase_initialize_repo_forGetAbsensiUserListUseCase
  }
  void dispose() {
    //auto_darttecture_usecase_dispose
    _GetAbsensiUserListUseCase?.dispose();
  }

//auto_darttecture_class_body
//startFunctionCallGetAbsensiUserListUseCase
  void callGetAbsensiUserListUseCase() {
    print("eksekusi GetAbsensiUserListUseCase");
    _GetAbsensiUserListUseCase?.execute(_GetAbsensiUserListUseCaseObserver(this),
        GetAbsensiUserListUseCaseParams());
  }
//stopFunctionCallGetAbsensiUserListUseCase
}

//auto_darttecture_class_outside
//startPresenterObserverUseCaseGetAbsensiUserListUseCase
class _GetAbsensiUserListUseCaseObserver implements Observer<AbsensiUser> {
  // The above presenter
  list_absensi_presenter _list_absensi_presenter;
  _GetAbsensiUserListUseCaseObserver(this._list_absensi_presenter);

  /// implement if the `Stream` emits a value
  void onNext(the_value) {
    if (_list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnNext !=
        null) {
      _list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnNext(
          the_value);
    }
  }

  /// Login is successfull, trigger event in [LoginController]
  void onComplete() {
    // any cleaning or preparation goes here
    if (_list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnComplete !=
        null) {
      _list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnComplete();
    }
  }

  /// Login was unsuccessful, trigger event in [LoginController]
  void onError(e) {
    // any cleaning or preparation goes here
    if (_list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnError !=
        null) {
      _list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnError(e);
    }
  }
}
//endPresenterObserverUseCaseGetAbsensiUserListUseCase
