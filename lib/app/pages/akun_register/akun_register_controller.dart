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
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:place_picker/place_picker.dart';
import 'akun_register_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//auto_darttecture_import_usecase_UserRegisterUseCase
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';


class akun_register_controller extends Controller {
  akun_register_presenter _akun_register_presenter;
  //auto_darttecture_class_var_declaration
//startControllerUseCaseVarDeclarationForUserRegisterUseCase
  late Function(String errorMessageByUseCaseUserRegisterUseCase)
      tambahan_callUserRegisterUseCaseOnError;
  late Function(Respon) tambahan_callUserRegisterUseCaseOnNext;
  late Function tambahan_callUserRegisterUseCaseOnComplete;
  var StartedUseCaseUserRegisterUseCase = false;
  var StatusByUseCaseUserRegisterUseCase = "idle";
  var MessageByUseCaseUserRegisterUseCase = "";
//endControllerUseCaseVarDeclarationForUserRegisterUseCase
  akun_register_controller(
    UserRepository _UserRepository,
    
  ) : _akun_register_presenter = akun_register_presenter(_UserRepository,
          
        ) {
    //getAuthStatus();
    //countProductInCart();
    initListeners();
  }
  void registerUser(){
    if (!formKey.currentState!.saveAndValidate()) {
      TampilanDialog.alertDialog("Maaf", "Lengkapi form terlebih dahulu");
    } else {
      final name =
          formKey.currentState!.fields["name"]!.value as String;
      final email =
          formKey.currentState!.fields["email"]!.value as String;
      final password =
          formKey.currentState!.fields["password"]!.value as String;
      callUserRegisterUseCase(name:name,email: email, password: password,onError: (e){

      TampilanDialog.alertDialog("Gagal Register", "${e}");
      },onNext: (theRespon){
        Get.to(home_user_view());
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
//startPresenterListenerOnUseCaseUserRegisterUseCase
    _akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnNext =
        (Respon the_value) {
      this.ListenUseCaseUserRegisterUseCaseOnNext(the_value);
    };
    _akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnError =
        this.ListenUseCaseUserRegisterUseCaseOnError;
    _akun_register_presenter.ListenUseCaseUserRegisterUseCaseOnComplete =
        this.ListenUseCaseUserRegisterUseCaseOnComplete;
//stopPresenterListenerOnUseCaseUserRegisterUseCase
  }

  BuildContext? dialogContext;
  void handlePermissions() {}
  void dispose() => _akun_register_presenter.dispose();
 
//auto_darttecture_class_body
//startControllerCallUseCaseUserRegisterUseCase
  static defaultFuncONNextUserRegisterUseCase(Respon theValue) {}
  static defaultFuncONErrorUserRegisterUseCase(String errorMessage) {}
  static defaultFuncONCompleteUserRegisterUseCase() {}
  void callUserRegisterUseCase(
      {required String name,required String email,required String password,Function(Respon) onNext =
          defaultFuncONNextUserRegisterUseCase,
      Function(String errorMessageByUseCaseUserRegisterUseCase) onError =
          defaultFuncONErrorUserRegisterUseCase,
      Function onComplete =
          defaultFuncONCompleteUserRegisterUseCase}) async {
    tambahan_callUserRegisterUseCaseOnNext = onNext;
    tambahan_callUserRegisterUseCaseOnError = onError;
    tambahan_callUserRegisterUseCaseOnComplete = onComplete;
    StatusByUseCaseUserRegisterUseCase = "ongoing";
    StartedUseCaseUserRegisterUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callUserRegisterUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _akun_register_presenter.callUserRegisterUseCase(name,email,password));
  }

//endControllerCallUseCaseUserRegisterUseCase
//startListenerOnUseCaseUserRegisterUseCase
  void ListenUseCaseUserRegisterUseCaseOnNext(Respon the_value) {
    //get called when usecase UserRegisterUseCase return value
    //dismissLoading();
    StatusByUseCaseUserRegisterUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseUserRegisterUseCaseOnNext
//endDefaultFunctionOnListenUseCaseUserRegisterUseCaseOnNext
    if (tambahan_callUserRegisterUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserRegisterUseCaseOnNext());
      tambahan_callUserRegisterUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseUserRegisterUseCaseOnError(e) {
    StatusByUseCaseUserRegisterUseCase = "onerror";
    MessageByUseCaseUserRegisterUseCase = e.toString();
    //get called when usecase UserRegisterUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseUserRegisterUseCaseOnError
//endDefaultFunctionOnListenUseCaseUserRegisterUseCaseOnError
    if (tambahan_callUserRegisterUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserRegisterUseCaseonError());
      tambahan_callUserRegisterUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari UserRegisterUseCase");
    //refreshUI();
  }

  void ListenUseCaseUserRegisterUseCaseOnComplete() {
    StatusByUseCaseUserRegisterUseCase = "oncomplete";
    //get called when usecase UserRegisterUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseUserRegisterUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseUserRegisterUseCaseOnComplete
    if (tambahan_callUserRegisterUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callUserRegisterUseCaseonComplete());
      tambahan_callUserRegisterUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari UserRegisterUseCase");
    //refreshUI();
  }
//stopListenerOnUseCaseUserRegisterUseCase
}
//auto_darttecture_class_outside
