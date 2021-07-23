import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';

class TampilanDialog {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    Future<void> handleSubmit(BuildContext context) async {
      try {
        Navigator.of(key.currentContext!, rootNavigator: true)
            .pop(); //close the dialoge

      } catch (error) {
        print(error);
      }
    }

    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }

  static Future<void> showDialogPesanAlert(
    String tulisan_title,
    String tulisan_sub_title, {
    FaIcon the_icon: TemaIkonDialog.alert,
    BuildContext? context,
    GlobalKey? key,
  }) async {
    await Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)), //this right here
        child: Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  child: the_icon,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                Text(
                  tulisan_title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Popins",
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  tulisan_sub_title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Popins",
                    fontSize: 11.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Warna.warnaUtama,
                          ),
                          child: Center(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  static alertDialog(String title, String subTitle) {
    Alert(
      context: Get.context!,
      type: AlertType.warning,
      title: title,
      desc: subTitle,
      buttons: [
        DialogButton(
          color: Warna.warnaUtama,
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Get.back(),
          width: 120,
        )
      ],
    ).show();
  }

  static Future<bool> showDialogTanya(
    String tulisan_title,
    String tulisan_sub_title, {
    BuildContext? context,
    GlobalKey? key,
  }) async {
    bool isiKonfirm = false;
    await Get.defaultDialog(
        title: tulisan_title,
        textConfirm: "Ya",
        textCancel: "Tidak",
        onConfirm: () {
          isiKonfirm = true;
          Get.back();
        },
        middleText: tulisan_sub_title);
    return isiKonfirm;
  }

  static Future<File?> DialogFilePicker() async {
    late File selectedImage;

    final picker = ImagePicker();

    var pilihanBrowser = await Get.dialog(AlertDialog(
      title: Text("Mengambil Foto"),
      content: Text("Pilih Sumber"),
      actions: <Widget>[
        FlatButton(
          child: Text("Kamera"),
          onPressed: () {
            Get.back(result: "kamera");
          },
        ),
        FlatButton(
          child: Text("File"),
          onPressed: () {
            Get.back(result: "file");
          },
        )
      ],
    ));

    if (pilihanBrowser != null) {
      print("pilihanBrowser : ${pilihanBrowser}");

      if (pilihanBrowser == "kamera") {
        final pickedFile = await picker.getImage(source: ImageSource.camera);
        File _image = File(pickedFile!.path);
        selectedImage = _image;

        if (selectedImage != null) {
          return (selectedImage);
        }
      }
      if (pilihanBrowser == "file") {
        final pickedFile = await picker.getImage(source: ImageSource.gallery);
        File _image = File(pickedFile!.path);
        selectedImage = _image;

        if (selectedImage != null) {
          return (selectedImage);
        }
      }
    }
    return null;
    // final pickedFile = await picker.getImage(source: ImageSource.camera);

    // setState(() {
    //   _image = File(pickedFile.path);
    // });
  }
}

class TemaIkonDialog {
  static const FaIcon alert = FaIcon(
    FontAwesomeIcons.exclamationCircle,
    size: 30,
    color: Colors.red,
  );
  static const FaIcon succcess = FaIcon(
    FontAwesomeIcons.checkCircle,
    size: 30,
    color: Colors.green,
  );
}
