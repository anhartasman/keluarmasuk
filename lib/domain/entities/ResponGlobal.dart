import 'dart:convert';

import 'UserAplikasi.dart';

class ResponGlobal<T> {
  bool success;
  bool errorFromAPI;
  T? the_respon;

  String error_code = "000";

  String error_msg = "";
  ResponGlobal({
    this.the_respon,
    this.error_code = "000",
    this.error_msg = "",
    this.success = true,
    this.errorFromAPI = false,
  });
}
