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
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';
import 'package:keluarmasuk/app/widgets/RPSCustomPainter.dart';
import 'blank_page_controller.dart';
import 'package:after_layout/after_layout.dart';
//import 'package:openpgp/openpgp.dart';
import 'package:permission_handler/permission_handler.dart';

class blank_page_view extends View {
  blank_page_view();
  @override
  blank_page_viewView createState() =>
      blank_page_viewView(blank_page_controller());
}

class blank_page_viewView
    extends ViewState<blank_page_view, blank_page_controller>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<blank_page_view> {
  blank_page_viewView(blank_page_controller controller) : super(controller);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget get view {
    return Scaffold(
        key: globalKey,
        body: ControlledWidgetBuilder<blank_page_controller>(
            builder: (context, controller) {
          return controller.onLoading
              ? SpinKitWave(
                  color: Colors.pink,
                  size: 50.0,
                  controller: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 1200)),
                )
              : FormBuilder(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [],
                    ),
                  ));
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
