import 'package:flutter/animation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/FilterAbsensi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'list_absensi_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//auto_darttecture_import_usecase_GetAbsensiUserListUseCase
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

class list_absensi_controller extends Controller {
  list_absensi_presenter _list_absensi_presenter;
  FilterAbsensi theFilter;
  //auto_darttecture_class_var_declaration
//startControllerUseCaseVarDeclarationForGetAbsensiUserListUseCase
  late Function(String errorMessageByUseCaseGetAbsensiUserListUseCase)
      tambahan_callGetAbsensiUserListUseCaseOnError;
  late Function(AbsensiUser) tambahan_callGetAbsensiUserListUseCaseOnNext;
  late Function tambahan_callGetAbsensiUserListUseCaseOnComplete;
  var StartedUseCaseGetAbsensiUserListUseCase = false;
  var StatusByUseCaseGetAbsensiUserListUseCase = "idle";
  var MessageByUseCaseGetAbsensiUserListUseCase = "";
//endControllerUseCaseVarDeclarationForGetAbsensiUserListUseCase
  list_absensi_controller(
    this.theFilter,
    AbsensiUserRepository _AbsensiUserRepository,
    UserRepository _UserRepository,
  ) : _list_absensi_presenter = list_absensi_presenter(
          _AbsensiUserRepository,
          _UserRepository,
        ) {
    //getAuthStatus();
    //countProductInCart();
    initListeners();
  }
  List<AbsensiUser> absensi_list = [];
  @override
  void onInitState() {
    callGetAbsensiUserListUseCase(
        theFilter: theFilter,
        onNext: (theAbsensi) {
          absensi_list.add(theAbsensi);
        },
        onComplete: () {
          stopLoadingInfoKlien();
        });
    Future.delayed(Duration(seconds: 1), () {
      stopLoading();
    });
  }

  bool onLoadingInfoKlien = true;
  void startLoadingInfoKlien() {
    onLoadingInfoKlien = true;
    notifyListeners();
  }

  void stopLoadingInfoKlien() {
    onLoadingInfoKlien = false;
    notifyListeners();
  }

  bool onLoading = true;
  void startLoading() {
    onLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    onLoading = false;
    notifyListeners();
  }

  @override
  void initListeners() {
    //use_case_initListener
//startPresenterListenerOnUseCaseGetAbsensiUserListUseCase
    _list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnNext =
        (AbsensiUser the_value) {
      this.ListenUseCaseGetAbsensiUserListUseCaseOnNext(the_value);
    };
    _list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnError =
        this.ListenUseCaseGetAbsensiUserListUseCaseOnError;
    _list_absensi_presenter.ListenUseCaseGetAbsensiUserListUseCaseOnComplete =
        this.ListenUseCaseGetAbsensiUserListUseCaseOnComplete;
//stopPresenterListenerOnUseCaseGetAbsensiUserListUseCase
  }

  void handlePermissions() {}
  void dispose() => _list_absensi_presenter.dispose();
//auto_darttecture_class_body
//startControllerCallUseCaseGetAbsensiUserListUseCase
  static defaultFuncONNextGetAbsensiUserListUseCase(AbsensiUser theValue) {}
  static defaultFuncONErrorGetAbsensiUserListUseCase(String errorMessage) {}
  static defaultFuncONCompleteGetAbsensiUserListUseCase() {}
  void callGetAbsensiUserListUseCase(
      {required FilterAbsensi theFilter,
      Function(AbsensiUser) onNext = defaultFuncONNextGetAbsensiUserListUseCase,
      Function(String errorMessageByUseCaseGetAbsensiUserListUseCase) onError =
          defaultFuncONErrorGetAbsensiUserListUseCase,
      Function onComplete =
          defaultFuncONCompleteGetAbsensiUserListUseCase}) async {
    tambahan_callGetAbsensiUserListUseCaseOnNext = onNext;
    tambahan_callGetAbsensiUserListUseCaseOnError = onError;
    tambahan_callGetAbsensiUserListUseCaseOnComplete = onComplete;
    StatusByUseCaseGetAbsensiUserListUseCase = "ongoing";
    StartedUseCaseGetAbsensiUserListUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callGetAbsensiUserListUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _list_absensi_presenter.callGetAbsensiUserListUseCase(theFilter));
  }

//endControllerCallUseCaseGetAbsensiUserListUseCase
//startListenerOnUseCaseGetAbsensiUserListUseCase
  void ListenUseCaseGetAbsensiUserListUseCaseOnNext(AbsensiUser the_value) {
    //get called when usecase GetAbsensiUserListUseCase return value
    //dismissLoading();
    StatusByUseCaseGetAbsensiUserListUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseGetAbsensiUserListUseCaseOnNext
//endDefaultFunctionOnListenUseCaseGetAbsensiUserListUseCaseOnNext
    if (tambahan_callGetAbsensiUserListUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetAbsensiUserListUseCaseOnNext());
      tambahan_callGetAbsensiUserListUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseGetAbsensiUserListUseCaseOnError(e) {
    StatusByUseCaseGetAbsensiUserListUseCase = "onerror";
    MessageByUseCaseGetAbsensiUserListUseCase = e.toString();
    //get called when usecase GetAbsensiUserListUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseGetAbsensiUserListUseCaseOnError
//endDefaultFunctionOnListenUseCaseGetAbsensiUserListUseCaseOnError
    if (tambahan_callGetAbsensiUserListUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetAbsensiUserListUseCaseonError());
      tambahan_callGetAbsensiUserListUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari GetAbsensiUserListUseCase");
    //refreshUI();
  }

  void ListenUseCaseGetAbsensiUserListUseCaseOnComplete() {
    StatusByUseCaseGetAbsensiUserListUseCase = "oncomplete";
    //get called when usecase GetAbsensiUserListUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseGetAbsensiUserListUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseGetAbsensiUserListUseCaseOnComplete
    if (tambahan_callGetAbsensiUserListUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetAbsensiUserListUseCaseonComplete());
      tambahan_callGetAbsensiUserListUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari GetAbsensiUserListUseCase");
    //refreshUI();
  }
//stopListenerOnUseCaseGetAbsensiUserListUseCase
}
//auto_darttecture_class_outside
