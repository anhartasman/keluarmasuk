import 'package:flutter/animation.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/app/pages/utils/TampilanDialog.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:keluarmasuk/domain/entities/Respon.dart';
import 'package:keluarmasuk/domain/repositories/AbsensiUserRepository.dart';

import 'package:place_picker/place_picker.dart';
import 'form_absensi_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//auto_darttecture_import_usecase_ToggleAbsensiUserUseCase
//auto_darttecture_import_usecase_GetCurrentAbsensiUserUseCase
import 'package:keluarmasuk/domain/repositories/UserRepository.dart';

class form_absensi_controller extends Controller {
  form_absensi_presenter _form_absensi_presenter;
  //auto_darttecture_class_var_declaration
//startControllerUseCaseVarDeclarationForToggleAbsensiUserUseCase
  late Function(String errorMessageByUseCaseToggleAbsensiUserUseCase)
      tambahan_callToggleAbsensiUserUseCaseOnError;
  late Function(Respon) tambahan_callToggleAbsensiUserUseCaseOnNext;
  late Function tambahan_callToggleAbsensiUserUseCaseOnComplete;
  var StartedUseCaseToggleAbsensiUserUseCase = false;
  var StatusByUseCaseToggleAbsensiUserUseCase = "idle";
  var MessageByUseCaseToggleAbsensiUserUseCase = "";
//endControllerUseCaseVarDeclarationForToggleAbsensiUserUseCase
//startControllerUseCaseVarDeclarationForGetCurrentAbsensiUserUseCase
  late Function(String errorMessageByUseCaseGetCurrentAbsensiUserUseCase)
      tambahan_callGetCurrentAbsensiUserUseCaseOnError;
  late Function(AbsensiUser) tambahan_callGetCurrentAbsensiUserUseCaseOnNext;
  late Function tambahan_callGetCurrentAbsensiUserUseCaseOnComplete;
  var StartedUseCaseGetCurrentAbsensiUserUseCase = false;
  var StatusByUseCaseGetCurrentAbsensiUserUseCase = "idle";
  var MessageByUseCaseGetCurrentAbsensiUserUseCase = "";
//endControllerUseCaseVarDeclarationForGetCurrentAbsensiUserUseCase

  form_absensi_controller(
    AbsensiUserRepository _AbsensiUserRepository,
    UserRepository _UserRepository,
  ) : _form_absensi_presenter = form_absensi_presenter(
          _AbsensiUserRepository,
          _UserRepository,
        ) {
    //getAuthStatus();
    //countProductInCart();
    initListeners();
  }

  AbsensiUser? currentAbsensi;
  var txtCtrlLabelAbsenIn = new TextEditingController();

  var txtCtrlLabelAbsenOut = new TextEditingController();

  @override
  void onInitState() {
    final planDate = DateTime.now();
    labelTanggal =
        DateFormat("EEEE, dd MMMM yyyy HH:mm", "id_ID").format(planDate);
    txtCtrlLabelAbsenIn.text =
        DateFormat("EEEE, dd MMMM yyyy HH:mm", "id_ID").format(planDate);
    callGetCurrentAbsensiUserUseCase(
        onNext: (theAbsensi) {
          currentAbsensi = theAbsensi;
          txtCtrlLabelAbsenIn.text =
              DateFormat("EEEE, dd MMMM yyyy HH:mm", "id_ID").format(
                  DateTime.fromMillisecondsSinceEpoch(currentAbsensi!.absenIn));
          txtCtrlLabelAbsenOut.text = labelTanggal;
        },
        onError: (e) => stopLoading(),
        onComplete: stopLoading);
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
  void prosesAbsen() {
    startLoading();
    callToggleAbsensiUserUseCase(
        onNext: (theRespon) {
          TampilanDialog.showDialogPesanAlert("Berhasil", "Absen tercatat",
                  the_icon: TemaIkonDialog.succcess)
              .then((value) {
            Get.back();
          });
        },
        onComplete: stopLoading,
        onError: (_) => stopLoading());
  }

  String labelTanggal = "";
  @override
  void initListeners() {
    //use_case_initListener
//startPresenterListenerOnUseCaseToggleAbsensiUserUseCase
    _form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnNext =
        (Respon the_value) {
      this.ListenUseCaseToggleAbsensiUserUseCaseOnNext(the_value);
    };
    _form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnError =
        this.ListenUseCaseToggleAbsensiUserUseCaseOnError;
    _form_absensi_presenter.ListenUseCaseToggleAbsensiUserUseCaseOnComplete =
        this.ListenUseCaseToggleAbsensiUserUseCaseOnComplete;
//stopPresenterListenerOnUseCaseToggleAbsensiUserUseCase

//startPresenterListenerOnUseCaseGetCurrentAbsensiUserUseCase
    _form_absensi_presenter.ListenUseCaseGetCurrentAbsensiUserUseCaseOnNext =
        (AbsensiUser the_value) {
      this.ListenUseCaseGetCurrentAbsensiUserUseCaseOnNext(the_value);
    };
    _form_absensi_presenter.ListenUseCaseGetCurrentAbsensiUserUseCaseOnError =
        this.ListenUseCaseGetCurrentAbsensiUserUseCaseOnError;
    _form_absensi_presenter
            .ListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete =
        this.ListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete;
//stopPresenterListenerOnUseCaseGetCurrentAbsensiUserUseCase
  }

  BuildContext? dialogContext;
  void handlePermissions() {}
  void dispose() => _form_absensi_presenter.dispose();

//auto_darttecture_class_body
//startControllerCallUseCaseToggleAbsensiUserUseCase
  static defaultFuncONNextToggleAbsensiUserUseCase(Respon theValue) {}
  static defaultFuncONErrorToggleAbsensiUserUseCase(String errorMessage) {}
  static defaultFuncONCompleteToggleAbsensiUserUseCase() {}
  void callToggleAbsensiUserUseCase(
      {Function(Respon) onNext = defaultFuncONNextToggleAbsensiUserUseCase,
      Function(String errorMessageByUseCaseToggleAbsensiUserUseCase) onError =
          defaultFuncONErrorToggleAbsensiUserUseCase,
      Function onComplete =
          defaultFuncONCompleteToggleAbsensiUserUseCase}) async {
    tambahan_callToggleAbsensiUserUseCaseOnNext = onNext;
    tambahan_callToggleAbsensiUserUseCaseOnError = onError;
    tambahan_callToggleAbsensiUserUseCaseOnComplete = onComplete;
    StatusByUseCaseToggleAbsensiUserUseCase = "ongoing";
    StartedUseCaseToggleAbsensiUserUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callToggleAbsensiUserUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _form_absensi_presenter.callToggleAbsensiUserUseCase());
  }

//endControllerCallUseCaseToggleAbsensiUserUseCase
//startListenerOnUseCaseToggleAbsensiUserUseCase
  void ListenUseCaseToggleAbsensiUserUseCaseOnNext(Respon the_value) {
    //get called when usecase ToggleAbsensiUserUseCase return value
    //dismissLoading();
    StatusByUseCaseToggleAbsensiUserUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseToggleAbsensiUserUseCaseOnNext
//endDefaultFunctionOnListenUseCaseToggleAbsensiUserUseCaseOnNext
    if (tambahan_callToggleAbsensiUserUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callToggleAbsensiUserUseCaseOnNext());
      tambahan_callToggleAbsensiUserUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseToggleAbsensiUserUseCaseOnError(e) {
    StatusByUseCaseToggleAbsensiUserUseCase = "onerror";
    MessageByUseCaseToggleAbsensiUserUseCase = e.toString();
    //get called when usecase ToggleAbsensiUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseToggleAbsensiUserUseCaseOnError
//endDefaultFunctionOnListenUseCaseToggleAbsensiUserUseCaseOnError
    if (tambahan_callToggleAbsensiUserUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callToggleAbsensiUserUseCaseonError());
      tambahan_callToggleAbsensiUserUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari ToggleAbsensiUserUseCase");
    //refreshUI();
  }

  void ListenUseCaseToggleAbsensiUserUseCaseOnComplete() {
    StatusByUseCaseToggleAbsensiUserUseCase = "oncomplete";
    //get called when usecase ToggleAbsensiUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseToggleAbsensiUserUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseToggleAbsensiUserUseCaseOnComplete
    if (tambahan_callToggleAbsensiUserUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callToggleAbsensiUserUseCaseonComplete());
      tambahan_callToggleAbsensiUserUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari ToggleAbsensiUserUseCase");
    //refreshUI();
  }

//stopListenerOnUseCaseToggleAbsensiUserUseCase
//startControllerCallUseCaseGetCurrentAbsensiUserUseCase
  static defaultFuncONNextGetCurrentAbsensiUserUseCase(AbsensiUser theValue) {}
  static defaultFuncONErrorGetCurrentAbsensiUserUseCase(String errorMessage) {}
  static defaultFuncONCompleteGetCurrentAbsensiUserUseCase() {}
  void callGetCurrentAbsensiUserUseCase(
      {Function(AbsensiUser) onNext =
          defaultFuncONNextGetCurrentAbsensiUserUseCase,
      Function(String errorMessageByUseCaseGetCurrentAbsensiUserUseCase)
          onError = defaultFuncONErrorGetCurrentAbsensiUserUseCase,
      Function onComplete =
          defaultFuncONCompleteGetCurrentAbsensiUserUseCase}) async {
    tambahan_callGetCurrentAbsensiUserUseCaseOnNext = onNext;
    tambahan_callGetCurrentAbsensiUserUseCaseOnError = onError;
    tambahan_callGetCurrentAbsensiUserUseCaseOnComplete = onComplete;
    StatusByUseCaseGetCurrentAbsensiUserUseCase = "ongoing";
    StartedUseCaseGetCurrentAbsensiUserUseCase = true;
    //showLoading();
    // so the animation can be seen
    print("controller try callGetCurrentAbsensiUserUseCase");
    Future.delayed(Duration(seconds: 0),
        () => _form_absensi_presenter.callGetCurrentAbsensiUserUseCase());
  }

//endControllerCallUseCaseGetCurrentAbsensiUserUseCase
//startListenerOnUseCaseGetCurrentAbsensiUserUseCase
  void ListenUseCaseGetCurrentAbsensiUserUseCaseOnNext(AbsensiUser the_value) {
    //get called when usecase GetCurrentAbsensiUserUseCase return value
    //dismissLoading();
    StatusByUseCaseGetCurrentAbsensiUserUseCase = "onnext";
//startDefaultFunctionOnListenUseCaseGetCurrentAbsensiUserUseCaseOnNext
//endDefaultFunctionOnListenUseCaseGetCurrentAbsensiUserUseCaseOnNext
    if (tambahan_callGetCurrentAbsensiUserUseCaseOnNext != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetCurrentAbsensiUserUseCaseOnNext());
      tambahan_callGetCurrentAbsensiUserUseCaseOnNext(the_value);
    }
    //
    //print("dapat layanan : " + the_categories.length.toString());
    //refreshUI();
  }

  void ListenUseCaseGetCurrentAbsensiUserUseCaseOnError(e) {
    StatusByUseCaseGetCurrentAbsensiUserUseCase = "onerror";
    MessageByUseCaseGetCurrentAbsensiUserUseCase = e.toString();
    //get called when usecase GetCurrentAbsensiUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseGetCurrentAbsensiUserUseCaseOnError
//endDefaultFunctionOnListenUseCaseGetCurrentAbsensiUserUseCaseOnError
    if (tambahan_callGetCurrentAbsensiUserUseCaseOnError != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetCurrentAbsensiUserUseCaseonError());
      tambahan_callGetCurrentAbsensiUserUseCaseOnError(e);
    }
    //layanan_list = null;
    print("dapat error dari GetCurrentAbsensiUserUseCase");
    //refreshUI();
  }

  void ListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete() {
    StatusByUseCaseGetCurrentAbsensiUserUseCase = "oncomplete";
    //get called when usecase GetCurrentAbsensiUserUseCase return error
    //dismissLoading();
    //showGenericSnackbar(getStateKey(), e.message, isError: true);
//startDefaultFunctionOnListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete
//endDefaultFunctionOnListenUseCaseGetCurrentAbsensiUserUseCaseOnComplete
    if (tambahan_callGetCurrentAbsensiUserUseCaseOnComplete != null) {
//Future.delayed(Duration(seconds: 0), ()=>tambahan_callGetCurrentAbsensiUserUseCaseonComplete());
      tambahan_callGetCurrentAbsensiUserUseCaseOnComplete();
    }
    //layanan_list = null;
    print("dapat oncomplete dari GetCurrentAbsensiUserUseCase");
    //refreshUI();
  }
//stopListenerOnUseCaseGetCurrentAbsensiUserUseCase
}
//auto_darttecture_class_outside
