import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';


import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';
import 'package:keluarmasuk/app/widgets/RPSCustomPainter.dart';
import 'list_absensi_controller.dart';
import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:keluarmasuk/data/repositories/DataAbsensiUserRepository.dart';
import 'package:keluarmasuk/data/repositories/DataUserRepository.dart';


class list_absensi_view extends View {
  list_absensi_view();
  @override
  list_absensi_viewView createState() =>
      list_absensi_viewView(list_absensi_controller(
        new DataAbsensiUserRepository(),
        new DataUserRepository(),
        
      ));
}

class list_absensi_viewView
    extends ViewState<list_absensi_view, list_absensi_controller>
    with TickerProviderStateMixin, AfterLayoutMixin<list_absensi_view> {
  list_absensi_viewView(list_absensi_controller controller) : super(controller);
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
          title: const Text('Daftar Klien'),
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            tooltip: 'Back',
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ControlledWidgetBuilder<list_absensi_controller>(
            builder: (context, controller) {
          if (controller.onLoading) {
            return SpinKitWave(
              color: Colors.pink,
              size: 50.0,
              controller: AnimationController(
                  vsync: this, duration: const Duration(milliseconds: 1200)),
            );
          } else if (controller.onLoadingInfoKlien) {
            return Column(
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 48.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Container(
                                          width: 40.0,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: 6,
                    ),
                  ),
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Text(
                              "Status Data Klien",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Popins",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Terverifikasi",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Popins",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "68",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Popins",
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Data Tidak Lengkap",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Popins",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Popins",
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Divider(
                          color: Colors.black12,
                          height: 2.0,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: "Popins",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "69",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Popins",
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.absensi_list.length,
                    itemBuilder: (buildContext, idx) {
                      final theAbsensi = controller.absensi_list[idx];
                      return InkWell(
                        onTap: () {
                          // Get.to(detail_klien_view(theInfoKlien.theKlien));
                        },
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.circle,
                                        color: Colors.red, size: 15),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${theAbsensi.theUser?.name}",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: "Popins",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "${theAbsensi.absenIn}",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontFamily: "Popins",
                                                      color: Colors.grey,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "${theAbsensi.absenOut}",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontFamily: "Popins",
                                                      color: Colors.grey,
                                                    ),
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Divider(
                                  color: Colors.black12,
                                  height: 2.0,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
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

class _menuHome extends StatelessWidget {
  final String title, subTitle;
  final IconData menuIcon;
  const _menuHome(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.menuIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25.0),
                        right: Radius.circular(8.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4.5,
                          spreadRadius: 1.0,
                          offset: Offset(
                            5,
                            5,
                          ),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${title}",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Popins",
                            color: Warna.warnaCoklat,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${subTitle}",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "Popins",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 30.0,
                width: 30.0,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1,
                        spreadRadius: 1.0,
                        offset: Offset(
                          1.0,
                          2.0,
                        ),
                      )
                    ]),
                child: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 12,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Warna.warnaCoklat,
          ),
          child: Center(
            child: FaIcon(menuIcon, size: 30, color: Warna.warnaKuning),
          ),
        ),
      ],
    );
  }
}
