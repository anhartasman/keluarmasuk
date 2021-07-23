import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/app/utils/constants.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';

class InfoAbsensiDisplay {
  AbsensiUser theAbsensi;
  InfoAbsensiDisplay(this.theAbsensi) {
    labelAbsenIn = DateFormat(formatJamTanggal, "id_ID")
        .format(DateTime.fromMillisecondsSinceEpoch(theAbsensi.absenIn));
    labelAbsenOut = DateFormat(formatJamTanggal, "id_ID")
        .format(DateTime.fromMillisecondsSinceEpoch(theAbsensi.absenOut));
    labelJamAbsenIn = DateFormat("HH:mm", "id_ID")
        .format(DateTime.fromMillisecondsSinceEpoch(theAbsensi.absenIn));
    labelJamAbsenOut = DateFormat("HH:mm", "id_ID")
        .format(DateTime.fromMillisecondsSinceEpoch(theAbsensi.absenOut));
  }
  String labelAbsenIn = "";
  String labelAbsenOut = "";
  String labelJamAbsenIn = "";
  String labelJamAbsenOut = "";
}
