import 'package:flutter/animation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intro_slider/slide_object.dart';
import 'blank_page_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class blank_page_controller extends Controller {
  blank_page_presenter _blank_page_presenter;
  //auto_darttecture_class_var_declaration
  blank_page_controller() : _blank_page_presenter = blank_page_presenter() {
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
  @override
  void initListeners() {
    //use_case_initListener
  }
  void handlePermissions() {}
  void dispose() => _blank_page_presenter.dispose();
//auto_darttecture_class_body
}
//auto_darttecture_class_outside
