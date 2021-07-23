import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';


import 'package:flutter/animation.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get/get.dart';
import 'package:keluarmasuk/UI/BottomNavigationBar.dart';
import 'package:keluarmasuk/app/pages/akun_login/akun_login_view.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:permission_handler/permission_handler.dart';
import 'splash_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//delete_auto_darttecture_import_usecase_GetLoggedInUserUseCase_done
class splash_controller extends Controller {
  splash_presenter _splash_presenter;
  //auto_darttecture_class_var_declaration
  splash_controller() : _splash_presenter = splash_presenter() {
    initListeners();
  }
  void authStatusOnNext(bool isAuth) {
    //String page = isAuth ? '/bottom_nav_home' : '/login';
    print("aaaa");
    String page = '/bottom_nav_home';
    Navigator.of(getContext()).pushReplacementNamed(page);
  }

  String token = '';
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
    Future.delayed(Duration(seconds: 3), () {
      Get.to(akun_login_view());
    });
  }

  @override
  void onInitState() {
      startAmbilData();
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
  void dispose() => _splash_presenter.dispose();
//auto_darttecture_class_body
}
//auto_darttecture_class_outside
