import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

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
import 'package:keluarmasuk/app/pages/form_absensi/form_absensi_view.dart';
import 'package:keluarmasuk/app/pages/form_cari_absen/form_cari_absen_view.dart';
import 'package:keluarmasuk/app/pages/home_user/home_user_view.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';
import 'package:keluarmasuk/app/widgets/RPSCustomPainter.dart';
import 'package:keluarmasuk/data/repositories/DataAbsensiUserRepository.dart';
import 'package:keluarmasuk/data/repositories/DataUserRepository.dart';
import 'home_user_controller.dart';
import 'package:after_layout/after_layout.dart';
//import 'package:openpgp/openpgp.dart';

class home_user_view extends View {
  home_user_view();
  @override
  home_user_viewView createState() => home_user_viewView(
      home_user_controller(DataAbsensiUserRepository(), DataUserRepository()));
}

class home_user_viewView extends ViewState<home_user_view, home_user_controller>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<home_user_view> {
  home_user_viewView(home_user_controller controller) : super(controller);
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
        body: ControlledWidgetBuilder<home_user_controller>(
            builder: (context, controller) {
          return controller.onLoading
              ? SpinKitWave(
                  color: Colors.pink,
                  size: 50.0,
                  controller: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 1200)),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, bottom: 20, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Halo, ${controller.theUser.name}!",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Popins",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Jangan lupa catat absensi mu",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Popins",
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Warna.warnaBiru,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                            vertical: 20,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Data Absen hari ini",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: "Popins",
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${controller.absen_day_list.length}",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: "Popins",
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Warna.warnaHijau,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                            vertical: 20,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Data Absen bulan ini",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: "Popins",
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${controller.absen_month_list.length}",
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: "Popins",
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Positioned.fill(
                            child: FractionallySizedBox(
                              alignment: Alignment.topLeft,
                              widthFactor: 0.25,
                              heightFactor: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Warna.warnaUtama,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(25.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 25,
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(form_absensi_view());
                                  },
                                  child: _menuHome(
                                    title: "Absensi",
                                    subTitle: "pendataan keluar masuk",
                                    menuIcon: FontAwesomeIcons.edit,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(form_cari_absen_view());
                                    },
                                    child: _menuHome(
                                      title: "Data Absensi",
                                      subTitle: "Lihat daftar keluar masuk",
                                      menuIcon: FontAwesomeIcons.book,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50.0,
                          left: 20,
                          right: 20,
                        ),
                        child: InkWell(
                          onTap: controller.prosesLogout,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Warna.warnaUtama,
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
