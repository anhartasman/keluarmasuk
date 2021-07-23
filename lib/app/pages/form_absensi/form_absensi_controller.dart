import 'package:flutter/animation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:place_picker/place_picker.dart';
import 'form_absensi_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//auto_darttecture_import_usecase_InsertAbsensiUserUseCase
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';


class form_absensi_controller extends Controller {
  form_absensi_presenter _form_absensi_presenter;
  //auto_darttecture_class_var_declaration
//startControllerUseCaseVarDeclarationForInsertAbsensiUserUseCase
  late Function(String errorMessageByUseCaseInsertAbsensiUserUseCase)
      tambahan_callInsertAbsensiUserUseCaseOnError;
  late Function(Respon) tambahan_callInsertAbsensiUserUseCaseOnNext;
  late Function tambahan_callInsertAbsensiUserUseCaseOnComplete;
  var StartedUseCaseInsertAbsensiUserUseCase = false;
  var StatusByUseCaseInsertAbsensiUserUseCase = "idle";
  var MessageByUseCaseInsertAbsensiUserUseCase = "";
//endControllerUseCaseVarDeclarationForInsertAbsensiUserUseCase
  form_absensi_controller(
    AbsensiUserRepository _AbsensiUserRepository,
    UserRepository _UserRepository,
    
  ) : _form_absensi_presenter = form_absensi_presenter(_AbsensiUserRepository,
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
  void prosesAbsen(){
    
  }
  @override
  void initListeners() {
    //use_case_initListener
//startPresenterListenerOnUseCaseInsertAbsensiUserUseCase
    _form_absensi_presenter.ListenUseCaseInsertAbsensiUserUseCaseOnNext =
        (Respon the_value) {
      this.ListenUseCaseInsertAbsensiUserUseCaseOnNext(the_value);
    };
    _form_absensi_presenter.ListenUseCaseInsertAbsensiUserUseCaseOnError =
        this.ListenUseCaseInsertAbsensiUserUseCaseOnError;
    _form_absensi_presenter.ListenUseCaseInsertAbsensiUserUseCaseOnComplete =
        this.ListenUseCaseInsertAbsensiUserUseCaseOnComplete;
//stopPresenterListenerOnUseCaseInsertAbsensiUserUseCase
  }

  BuildContext? dialogContext;
  void handlePermissions() {}
  void dispose() => _form_absensi_presenter.dispose();
 
//auto_darttecture_class_body
//startControllerCallUseCaseInsertAbsensiUserUseCase
  static defaultFuncONNextInsertAbsensiUserUseCase(Respon theValue) {}
  static defaultFuncONErrorInsertAbsensiUserUseCase(String errorMessage) {}
  static defaultFuncONCompleteInsertAbsensiUserUseCase() {}
  void callInsertAbsensiUserUseCase(
      {required IsiFormAbsensi isiForm,Function(Respon) onNext =
          defaultFuncONNextInsertAbsensiUserUseCase,
      Function(String errorMessageByUseCaseInsertAbsensiUserUseCase) onError =
          defaultFuncONErrorInsertAbsensiUserUseCase,
      Function onComplete =
          defaultFuncONCompleteInsertAbsensiUserUseCase}) async {
    tambahan_callInsertAbsensiUserUseCaseOnNext = onNext;
    tambahan_callInsertAbsensiUserUseCaseOnError = onError;
    tambahan_callInsertAbsensiUserUseCaseOnComplete = onComplete;
    StatusByUseCaseInsertAbsensiUserUseCase = "ongoing";
    StartedUseCaseInsertAbsensiUserUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callInsertAbsensiUserUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _form_absensi_presenter.callInsertAbsensiUserUseCase(isiForm));
  }

//endControllerCallUseCaseInsertAbsensiUserUseCase
//startListenerOnUseCaseInsertAbsensiUserUseCase
  void ListenUseCaseInsertAbsensiUserUseCaseOnNext(Respon the_value) {
    //get called when usecase InsertAbsensiUserUseCase return value
    //dismissLoading();
    StatusByUseCaseInsertAbsensiUserUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseInsertAbsensiUserUseCaseOnNext
//endDefaultFunctionOnListenUseCaseInsertAbsensiUserUseCaseOnNext
    if (tambahan_callInsertAbsensiUserUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callInsertAbsensiUserUseCaseOnNext());
      tambahan_callInsertAbsensiUserUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseInsertAbsensiUserUseCaseOnError(e) {
    StatusByUseCaseInsertAbsensiUserUseCase = "onerror";
    MessageByUseCaseInsertAbsensiUserUseCase = e.toString();
    //get called when usecase InsertAbsensiUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseInsertAbsensiUserUseCaseOnError
//endDefaultFunctionOnListenUseCaseInsertAbsensiUserUseCaseOnError
    if (tambahan_callInsertAbsensiUserUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callInsertAbsensiUserUseCaseonError());
      tambahan_callInsertAbsensiUserUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari InsertAbsensiUserUseCase");
    //refreshUI();
  }

  void ListenUseCaseInsertAbsensiUserUseCaseOnComplete() {
    StatusByUseCaseInsertAbsensiUserUseCase = "oncomplete";
    //get called when usecase InsertAbsensiUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseInsertAbsensiUserUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseInsertAbsensiUserUseCaseOnComplete
    if (tambahan_callInsertAbsensiUserUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callInsertAbsensiUserUseCaseonComplete());
      tambahan_callInsertAbsensiUserUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari InsertAbsensiUserUseCase");
    //refreshUI();
  }
//stopListenerOnUseCaseInsertAbsensiUserUseCase
}
//auto_darttecture_class_outside
