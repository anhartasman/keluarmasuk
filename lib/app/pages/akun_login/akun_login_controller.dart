import 'package:flutter/animation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/app/pages/home_user/home_user_view.dart';
import 'package:keluarmasuk/app/pages/utils/TampilanDialog.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/UserAplikasi.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:place_picker/place_picker.dart';
import 'akun_login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//auto_darttecture_import_usecase_UserLoginUseCase
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

class akun_login_controller extends Controller {
  akun_login_presenter _akun_login_presenter;
  //auto_darttecture_class_var_declaration
//startControllerUseCaseVarDeclarationForUserLoginUseCase
  late Function(String errorMessageByUseCaseUserLoginUseCase)
      tambahan_callUserLoginUseCaseOnError;
  late Function(UserAplikasi) tambahan_callUserLoginUseCaseOnNext;
  late Function tambahan_callUserLoginUseCaseOnComplete;
  var StartedUseCaseUserLoginUseCase = false;
  var StatusByUseCaseUserLoginUseCase = "idle";
  var MessageByUseCaseUserLoginUseCase = "";
//endControllerUseCaseVarDeclarationForUserLoginUseCase
  akun_login_controller(
    UserRepository _UserRepository,
  ) : _akun_login_presenter = akun_login_presenter(
          _UserRepository,
        ) {
    //getAuthStatus();
    //countProductInCart();
    initListeners();
  }
  void loginUser() {
    if (!formKey.currentState!.saveAndValidate()) {
      TampilanDialog.alertDialog("Maaf", "Lengkapi form terlebih dahulu");
    } else {
      final email = formKey.currentState!.fields["email"]!.value as String;
      final password =
          formKey.currentState!.fields["password"]!.value as String;
      callUserLoginUseCase(
          email: email,
          password: password,
          onError: (e) {
            TampilanDialog.alertDialog("Gagal Login", "${e}");
          },
          onNext: (theRespon) {
            Get.offAll(home_user_view());
          });
    }
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
//startPresenterListenerOnUseCaseUserLoginUseCase
    _akun_login_presenter.ListenUseCaseUserLoginUseCaseOnNext =
        (UserAplikasi the_value) {
      this.ListenUseCaseUserLoginUseCaseOnNext(the_value);
    };
    _akun_login_presenter.ListenUseCaseUserLoginUseCaseOnError =
        this.ListenUseCaseUserLoginUseCaseOnError;
    _akun_login_presenter.ListenUseCaseUserLoginUseCaseOnComplete =
        this.ListenUseCaseUserLoginUseCaseOnComplete;
//stopPresenterListenerOnUseCaseUserLoginUseCase
  }

  BuildContext? dialogContext;
  void handlePermissions() {}
  void dispose() => _akun_login_presenter.dispose();

//auto_darttecture_class_body
//startControllerCallUseCaseUserLoginUseCase
  static defaultFuncONNextUserLoginUseCase(UserAplikasi theValue) {}
  static defaultFuncONErrorUserLoginUseCase(String errorMessage) {}
  static defaultFuncONCompleteUserLoginUseCase() {}
  void callUserLoginUseCase(
      {required String email,
      required String password,
      Function(UserAplikasi) onNext = defaultFuncONNextUserLoginUseCase,
      Function(String errorMessageByUseCaseUserLoginUseCase) onError =
          defaultFuncONErrorUserLoginUseCase,
      Function onComplete = defaultFuncONCompleteUserLoginUseCase}) async {
    tambahan_callUserLoginUseCaseOnNext = onNext;
    tambahan_callUserLoginUseCaseOnError = onError;
    tambahan_callUserLoginUseCaseOnComplete = onComplete;
    StatusByUseCaseUserLoginUseCase = "ongoing";
    StartedUseCaseUserLoginUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callUserLoginUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _akun_login_presenter.callUserLoginUseCase(email, password));
  }

//endControllerCallUseCaseUserLoginUseCase
//startListenerOnUseCaseUserLoginUseCase
  void ListenUseCaseUserLoginUseCaseOnNext(UserAplikasi the_value) {
    //get called when usecase UserLoginUseCase return value
    //dismissLoading();
    StatusByUseCaseUserLoginUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseUserLoginUseCaseOnNext
//endDefaultFunctionOnListenUseCaseUserLoginUseCaseOnNext
    if (tambahan_callUserLoginUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserLoginUseCaseOnNext());
      tambahan_callUserLoginUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseUserLoginUseCaseOnError(e) {
    StatusByUseCaseUserLoginUseCase = "onerror";
    MessageByUseCaseUserLoginUseCase = e.toString();
    //get called when usecase UserLoginUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseUserLoginUseCaseOnError
//endDefaultFunctionOnListenUseCaseUserLoginUseCaseOnError
    if (tambahan_callUserLoginUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserLoginUseCaseonError());
      tambahan_callUserLoginUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari UserLoginUseCase");
    //refreshUI();
  }

  void ListenUseCaseUserLoginUseCaseOnComplete() {
    StatusByUseCaseUserLoginUseCase = "oncomplete";
    //get called when usecase UserLoginUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseUserLoginUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseUserLoginUseCaseOnComplete
    if (tambahan_callUserLoginUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserLoginUseCaseonComplete());
      tambahan_callUserLoginUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari UserLoginUseCase");
    //refreshUI();
  }
//stopListenerOnUseCaseUserLoginUseCase
}
//auto_darttecture_class_outside
