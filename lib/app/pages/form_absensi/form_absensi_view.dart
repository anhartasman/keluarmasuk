import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:keluarmasuk/app/pages/utils/GayaField.dart';
import 'package:keluarmasuk/app/utils/constants.dart';
import 'package:keluarmasuk/app/widgets/CircleProgress.dart';
import 'package:keluarmasuk/domain/entities/IsiFormAbsensi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get/get.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';
import 'form_absensi_controller.dart';
import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:keluarmasuk/data/repositories/DataAbsensiUserRepository.dart';
import 'package:keluarmasuk/data/repositories/DataUserRepository.dart';


class form_absensi_view extends View {
  form_absensi_view();
  @override
  form_absensi_viewView createState() =>
      form_absensi_viewView(
          form_absensi_controller(
        new DataAbsensiUserRepository(),
        new DataUserRepository(),
        
      ));
}

class form_absensi_viewView extends ViewState<
        form_absensi_view,
        form_absensi_controller>
    with
        TickerProviderStateMixin,
        AfterLayoutMixin<form_absensi_view> {
  form_absensi_viewView(
      form_absensi_controller controller)
      : super(controller);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget get view {
    return Scaffold(
        key: globalKey,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: const Text('Absensi'),
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            tooltip: 'Back',
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body:
            ControlledWidgetBuilder<form_absensi_controller>(
                builder: (context, controller) {
          if (controller.onLoading) {
            return SpinKitWave(
              color: Colors.pink,
              size: 50.0,
              controller: AnimationController(
                  vsync: this, duration: const Duration(milliseconds: 1200)),
            );
          }
          return SingleChildScrollView(
            child: FormBuilder(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    CircleProgress(
                        screen_width: 300,
                        max_progress: 2,
                        current_progress: 1),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                      child: Text(
                        "Form Absensi",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Popins",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                      height: 2.0,
                      thickness: 1,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Warna.warnaAbu,
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          child: new FormBuilderTextField(
                            name: "labelAbsenIn",
                            controller: controller.txtCtrlLabelAbsenIn,
                            decoration: GayaField.abu("Nama Lengkap"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                            keyboardType: TextInputType.text,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                    Visibility(
                      visible:controller.currentAbsensi!=null,
                                          child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Warna.warnaAbu,
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          child: new FormBuilderTextField(
                            name: "labelAbsenOut",
                            controller: controller.txtCtrlLabelAbsenOut,
                            decoration: GayaField.abu("Nama Lengkap"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                            keyboardType: TextInputType.text,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: InkWell(
                          onTap: controller.prosesAbsen,
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Warna.warnaUtama,
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Text(
                                  "Absen",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }
  @override
  void afterFirstLayout(BuildContext context) async {}
}
