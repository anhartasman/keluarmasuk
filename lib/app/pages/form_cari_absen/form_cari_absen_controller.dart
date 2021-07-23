import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get/get.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/UI/BottomNavigationBar.dart';
import 'package:keluarmasuk/app/pages/list_absensi/list_absensi_view.dart';
import 'package:keluarmasuk/app/utils/constants.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'form_cari_absen_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class form_cari_absen_controller extends Controller {
  form_cari_absen_presenter _form_cari_absen_presenter;
  //auto_darttecture_class_var_declaration
  form_cari_absen_controller()
      : _form_cari_absen_presenter = form_cari_absen_presenter() {
    //getAuthStatus();
    //countProductInCart();
    initListeners();
  }
  final formKey = GlobalKey<FormBuilderState>();

  var dateFrom = DateTime.now().subtract(Duration(days: 30));
  var dateTo = DateTime.now();

  var txtLabelDateFrom = new TextEditingController();

  var txtLabelDateTo = new TextEditingController();

  @override
  void onInitState() {
    setLabelDate();
    Future.delayed(Duration(seconds: 1), () {
      stopLoading();
    });
  }

  void setLabelDate() {
    txtLabelDateFrom.text = DateFormat(formatTanggal, "id_ID").format(dateFrom);
    txtLabelDateTo.text = DateFormat(formatTanggal, "id_ID").format(dateTo);
  }

  void cariAbsensi() {
    Get.to(list_absensi_view());
  }

  void cariDateFrom() {
    showRoundedDatePicker(
      context: getContext(),
      locale: Locale("id", "ID"),
      initialDate: dateFrom,
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime.now(),
      borderRadius: 16,
    ).then((newDateTime) {
      if (newDateTime != null) {
        dateFrom = newDateTime;
        final tanggal_pilihan =
            DateFormat(formatTanggal, "id_ID").format(newDateTime);
        txtLabelDateFrom.text = tanggal_pilihan;
      }
    });
  }

  void cariDateTo() {
    showRoundedDatePicker(
      context: getContext(),
      locale: Locale("id", "ID"),
      initialDate: dateTo,
      firstDate: dateFrom,
      lastDate: DateTime.now(),
      borderRadius: 16,
    ).then((newDateTime) {
      if (newDateTime != null) {
        dateTo = newDateTime;
        final tanggal_pilihan =
            DateFormat(formatTanggal, "id_ID").format(newDateTime);
        txtLabelDateTo.text = tanggal_pilihan;
      }
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
  void dispose() => _form_cari_absen_presenter.dispose();
//auto_darttecture_class_body
}
//auto_darttecture_class_outside
