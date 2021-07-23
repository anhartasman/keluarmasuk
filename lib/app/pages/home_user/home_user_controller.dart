import 'package:flutter/animation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/UI/BottomNavigationBar.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'home_user_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_user_controller extends Controller {
  home_user_presenter _home_user_presenter;
  //auto_darttecture_class_var_declaration
  home_user_controller() : _home_user_presenter = home_user_presenter() {
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

  void prosesLogout() {
    Get.to(bottomNavigationBar());

    // Get.to(form_registrasi_4_konfirmasi_view(IsiFormAbsensi()));
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
  }
  void handlePermissions() {}
  void dispose() => _home_user_presenter.dispose();
//auto_darttecture_class_body
}
//auto_darttecture_class_outside
