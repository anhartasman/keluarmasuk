import 'package:flutter/animation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/app/pages/akun_login/akun_login_view.dart';
import 'package:keluarmasuk/app/pages/home_user/home_user_view.dart';
import 'package:keluarmasuk/app/pages/utils/TampilanDialog.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:place_picker/place_picker.dart';
import 'splash_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//auto_darttecture_import_usecase_GetCurrentUserUseCase
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

class splash_controller extends Controller {
  splash_presenter _splash_presenter;
  //auto_darttecture_class_var_declaration
//startControllerUseCaseVarDeclarationForGetCurrentUserUseCase
  late Function(String errorMessageByUseCaseGetCurrentUserUseCase)
      tambahan_callGetCurrentUserUseCaseOnError;
  late Function(UserAplikasi) tambahan_callGetCurrentUserUseCaseOnNext;
  late Function tambahan_callGetCurrentUserUseCaseOnComplete;
  var StartedUseCaseGetCurrentUserUseCase = false;
  var StatusByUseCaseGetCurrentUserUseCase = "idle";
  var MessageByUseCaseGetCurrentUserUseCase = "";
//endControllerUseCaseVarDeclarationForGetCurrentUserUseCase
  splash_controller(
    UserRepository _UserRepository,
  ) : _splash_presenter = splash_presenter(
          _UserRepository,
        ) {
    //getAuthStatus();
    //countProductInCart();
    initListeners();
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

  String current_progress = "Request permissions";
  List<Permission> permission_list = [
    Permission.storage,
  ];
  void startAmbilData() {
    var semua_permission = true;
    permission_list.request().then((statuses) {
      statuses.forEach((key, value) {
        if (value.isDenied) {
          semua_permission = false;
        }
      });
      if (semua_permission) {
        current_progress = "Retrieving user account...";
        goToMain();
        notifyListeners();
      }
    });
  }

  void goToMain() {
    callGetCurrentUserUseCase(
        onComplete: () => Get.to(home_user_view()),
        onError: (e) {
          Get.to(akun_login_view());
        });
  }

  @override
  void onInitState() {
    startAmbilData();
  }

  @override
  void initListeners() {
    //use_case_initListener
//startPresenterListenerOnUseCaseGetCurrentUserUseCase
    _splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnNext =
        (UserAplikasi the_value) {
      this.ListenUseCaseGetCurrentUserUseCaseOnNext(the_value);
    };
    _splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnError =
        this.ListenUseCaseGetCurrentUserUseCaseOnError;
    _splash_presenter.ListenUseCaseGetCurrentUserUseCaseOnComplete =
        this.ListenUseCaseGetCurrentUserUseCaseOnComplete;
//stopPresenterListenerOnUseCaseGetCurrentUserUseCase
  }

  BuildContext? dialogContext;
  void handlePermissions() {}
  void dispose() => _splash_presenter.dispose();

//auto_darttecture_class_body
//startControllerCallUseCaseGetCurrentUserUseCase
  static defaultFuncONNextGetCurrentUserUseCase(UserAplikasi theValue) {}
  static defaultFuncONErrorGetCurrentUserUseCase(String errorMessage) {}
  static defaultFuncONCompleteGetCurrentUserUseCase() {}
  void callGetCurrentUserUseCase(
      {Function(UserAplikasi) onNext = defaultFuncONNextGetCurrentUserUseCase,
      Function(String errorMessageByUseCaseGetCurrentUserUseCase) onError =
          defaultFuncONErrorGetCurrentUserUseCase,
      Function onComplete = defaultFuncONCompleteGetCurrentUserUseCase}) async {
    tambahan_callGetCurrentUserUseCaseOnNext = onNext;
    tambahan_callGetCurrentUserUseCaseOnError = onError;
    tambahan_callGetCurrentUserUseCaseOnComplete = onComplete;
    StatusByUseCaseGetCurrentUserUseCase = "ongoing";
    StartedUseCaseGetCurrentUserUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callGetCurrentUserUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _splash_presenter.callGetCurrentUserUseCase());
  }

//endControllerCallUseCaseGetCurrentUserUseCase
//startListenerOnUseCaseGetCurrentUserUseCase
  void ListenUseCaseGetCurrentUserUseCaseOnNext(UserAplikasi the_value) {
    //get called when usecase GetCurrentUserUseCase return value
    //dismissLoading();
    StatusByUseCaseGetCurrentUserUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseGetCurrentUserUseCaseOnNext
//endDefaultFunctionOnListenUseCaseGetCurrentUserUseCaseOnNext
    if (tambahan_callGetCurrentUserUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetCurrentUserUseCaseOnNext());
      tambahan_callGetCurrentUserUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseGetCurrentUserUseCaseOnError(e) {
    StatusByUseCaseGetCurrentUserUseCase = "onerror";
    MessageByUseCaseGetCurrentUserUseCase = e.toString();
    //get called when usecase GetCurrentUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseGetCurrentUserUseCaseOnError
//endDefaultFunctionOnListenUseCaseGetCurrentUserUseCaseOnError
    if (tambahan_callGetCurrentUserUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetCurrentUserUseCaseonError());
      tambahan_callGetCurrentUserUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari GetCurrentUserUseCase");
    //refreshUI();
  }

  void ListenUseCaseGetCurrentUserUseCaseOnComplete() {
    StatusByUseCaseGetCurrentUserUseCase = "oncomplete";
    //get called when usecase GetCurrentUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseGetCurrentUserUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseGetCurrentUserUseCaseOnComplete
    if (tambahan_callGetCurrentUserUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetCurrentUserUseCaseonComplete());
      tambahan_callGetCurrentUserUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari GetCurrentUserUseCase");
    //refreshUI();
  }
//stopListenerOnUseCaseGetCurrentUserUseCase
}
//auto_darttecture_class_outside
