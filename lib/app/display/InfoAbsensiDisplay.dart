import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:keluarmasuk/app/utils/constants.dart';
import 'package:keluarmasuk/domain/entities/AbsensiUser.dart';

class InfoAbsensiDisplay {
  AbsensiUser theAbsensi;
  InfoAbsensiDisplay(this.theAbsensi) {
    final dateAbsenIn = DateTime.fromMillisecondsSinceEpoch(theAbsensi.absenIn);
    final dateAbsenOut =
        DateTime.fromMillisecondsSinceEpoch(theAbsensi.absenOut);
    labelAbsenIn = DateFormat(formatJamTanggal, "id_ID").format(dateAbsenIn);
    labelAbsenOut = DateFormat(formatJamTanggal, "id_ID").format(dateAbsenOut);
    labelJamAbsenIn = DateFormat("HH:mm", "id_ID").format(dateAbsenIn);
    labelJamAbsenOut = DateFormat("HH:mm", "id_ID").format(dateAbsenOut);

    final bedaMinute = dateAbsenOut.difference(dateAbsenIn).inMinutes;
    final jumlahJam = (bedaMinute / 60).floor();
    final sisaMenit = bedaMinute - (jumlahJam * 60);
    labelLamaKerja = "${jumlahJam} jam, ${sisaMenit} menit";
  }
  String labelAbsenIn = "";
  String labelAbsenOut = "";
  String labelJamAbsenIn = "";
  String labelJamAbsenOut = "";
  String labelLamaKerja = "";
}
