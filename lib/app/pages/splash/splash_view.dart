import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';
import 'package:keluarmasuk/data/repositories/DataUserRepository.dart';
import 'splash_controller.dart';
import 'package:after_layout/after_layout.dart';
//import 'package:openpgp/openpgp.dart';
import 'package:permission_handler/permission_handler.dart';

class splash_view extends View {
  splash_view();
  @override
  splash_viewView createState() =>
      splash_viewView(splash_controller(DataUserRepository()));
}

class splash_viewView extends ViewState<splash_view, splash_controller>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<splash_view> {
  late AnimationController _animationController;
  late Animation<double> _fadeInFadeOut;
  bool isSubscribed = false;
  static String dataName = '';
  static String dataAge = '';
  static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) {
    debugPrint('onBackgroundMessage: $message');
    if (message.containsKey('data')) {
      String name = '';
      String age = '';
      if (Platform.isIOS) {
        name = message['name'];
        age = message['age'];
      } else if (Platform.isAndroid) {
        var data = message['data'];
        name = data['name'];
        age = data['age'];
      }
      dataName = name;
      dataAge = age;
      debugPrint('onBackgroundMessage: name: $name & age: $age');
    }
    return true as dynamic;
  }

  splash_viewView(splash_controller controller) : super(controller);
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _fadeInFadeOut =
        Tween<double>(begin: 0.0, end: 0.5).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget get view {
    return Scaffold(
        key: globalKey,
        body: ControlledWidgetBuilder<splash_controller>(
            builder: (context, controller) {
          return Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _iconLoading(
                        fadeInFadeOut: _fadeInFadeOut,
                        lbl_progress: controller.current_progress),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Center(
                        child: const Text(
                          "Keluar Masuk Oke",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Popins",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }

  @override
  void afterFirstLayout(BuildContext context) async {}

  void getDataFcm(Map<String, dynamic> message) {
    String name = '';
    String age = '';
    if (Platform.isIOS) {
      name = message['name'];
      age = message['age'];
    } else if (Platform.isAndroid) {
      var data = message['data'];
      name = data['name'];
      age = data['age'];
    }
    if (name.isNotEmpty && age.isNotEmpty) {
      setState(() {
        dataName = name;
        dataAge = age;
      });
    }
    debugPrint('getDataFcm: name: $name & age: $age');
  }
}

class _iconLoading extends StatelessWidget {
  final Animation<double> fadeInFadeOut;
  final String lbl_progress;
  const _iconLoading(
      {Key? key, required this.fadeInFadeOut, required this.lbl_progress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FadeTransition(
            opacity: fadeInFadeOut,
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Image(
                image: AssetImage("assets/icon/app_icon.png"),
                fit: BoxFit.contain,
                width: ScreenUtil().setWidth(150),
              ),
            )),
      ],
    );
  }
}
