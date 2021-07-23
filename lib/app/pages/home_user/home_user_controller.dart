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
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:place_picker/place_picker.dart';
import 'home_user_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//auto_darttecture_import_usecase_UserLogoutUseCase
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

class home_user_controller extends Controller {
  home_user_presenter _home_user_presenter;
  //auto_darttecture_class_var_declaration
//startControllerUseCaseVarDeclarationForUserLogoutUseCase
  late Function(String errorMessageByUseCaseUserLogoutUseCase)
      tambahan_callUserLogoutUseCaseOnError;
  late Function(Respon) tambahan_callUserLogoutUseCaseOnNext;
  late Function tambahan_callUserLogoutUseCaseOnComplete;
  var StartedUseCaseUserLogoutUseCase = false;
  var StatusByUseCaseUserLogoutUseCase = "idle";
  var MessageByUseCaseUserLogoutUseCase = "";
//endControllerUseCaseVarDeclarationForUserLogoutUseCase
  home_user_controller(
    UserRepository _UserRepository,
  ) : _home_user_presenter = home_user_presenter(
          _UserRepository,
        ) {
    //getAuthStatus();
    //countProductInCart();
    initListeners();
  }

  @override
  void onInitState() {
    Future.delayed(Duration(seconds: 1), () {
      stopLoading();
    });
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

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initListeners() {
    //use_case_initListener
//startPresenterListenerOnUseCaseUserLogoutUseCase
    _home_user_presenter.ListenUseCaseUserLogoutUseCaseOnNext =
        (Respon the_value) {
      this.ListenUseCaseUserLogoutUseCaseOnNext(the_value);
    };
    _home_user_presenter.ListenUseCaseUserLogoutUseCaseOnError =
        this.ListenUseCaseUserLogoutUseCaseOnError;
    _home_user_presenter.ListenUseCaseUserLogoutUseCaseOnComplete =
        this.ListenUseCaseUserLogoutUseCaseOnComplete;
//stopPresenterListenerOnUseCaseUserLogoutUseCase
  }

  BuildContext? dialogContext;
  void handlePermissions() {}
  void dispose() => _home_user_presenter.dispose();
  void prosesLogout() {
    callUserLogoutUseCase(onComplete: () {
      Get.offAll(akun_login_view());
    });
  }

//auto_darttecture_class_body
//startControllerCallUseCaseUserLogoutUseCase
  static defaultFuncONNextUserLogoutUseCase(Respon theValue) {}
  static defaultFuncONErrorUserLogoutUseCase(String errorMessage) {}
  static defaultFuncONCompleteUserLogoutUseCase() {}
  void callUserLogoutUseCase(
      {Function(Respon) onNext = defaultFuncONNextUserLogoutUseCase,
      Function(String errorMessageByUseCaseUserLogoutUseCase) onError =
          defaultFuncONErrorUserLogoutUseCase,
      Function onComplete = defaultFuncONCompleteUserLogoutUseCase}) async {
    tambahan_callUserLogoutUseCaseOnNext = onNext;
    tambahan_callUserLogoutUseCaseOnError = onError;
    tambahan_callUserLogoutUseCaseOnComplete = onComplete;
    StatusByUseCaseUserLogoutUseCase = "ongoing";
    StartedUseCaseUserLogoutUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callUserLogoutUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _home_user_presenter.callUserLogoutUseCase());
  }

//endControllerCallUseCaseUserLogoutUseCase
//startListenerOnUseCaseUserLogoutUseCase
  void ListenUseCaseUserLogoutUseCaseOnNext(Respon the_value) {
    //get called when usecase UserLogoutUseCase return value
    //dismissLoading();
    StatusByUseCaseUserLogoutUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseUserLogoutUseCaseOnNext
//endDefaultFunctionOnListenUseCaseUserLogoutUseCaseOnNext
    if (tambahan_callUserLogoutUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserLogoutUseCaseOnNext());
      tambahan_callUserLogoutUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseUserLogoutUseCaseOnError(e) {
    StatusByUseCaseUserLogoutUseCase = "onerror";
    MessageByUseCaseUserLogoutUseCase = e.toString();
    //get called when usecase UserLogoutUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseUserLogoutUseCaseOnError
//endDefaultFunctionOnListenUseCaseUserLogoutUseCaseOnError
    if (tambahan_callUserLogoutUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserLogoutUseCaseonError());
      tambahan_callUserLogoutUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari UserLogoutUseCase");
    //refreshUI();
  }

  void ListenUseCaseUserLogoutUseCaseOnComplete() {
    StatusByUseCaseUserLogoutUseCase = "oncomplete";
    //get called when usecase UserLogoutUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseUserLogoutUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseUserLogoutUseCaseOnComplete
    if (tambahan_callUserLogoutUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserLogoutUseCaseonComplete());
      tambahan_callUserLogoutUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari UserLogoutUseCase");
    //refreshUI();
  }
//stopListenerOnUseCaseUserLogoutUseCase
}
//auto_darttecture_class_outside
