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
import 'package:keluarmasuk/data/repositories/DataUserRepository.dart';
import 'akun_register_controller.dart';
import 'package:after_layout/after_layout.dart';
//import 'package:openpgp/openpgp.dart';
import 'package:permission_handler/permission_handler.dart';

class akun_register_view extends View {
  akun_register_view();
  @override
  akun_register_viewView createState() =>
      akun_register_viewView(akun_register_controller(DataUserRepository()));
}

class akun_register_viewView
    extends ViewState<akun_register_view, akun_register_controller>
    with SingleTickerProviderStateMixin, AfterLayoutMixin<akun_register_view> {
  akun_register_viewView(akun_register_controller controller) : super(controller);
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


  @override
  Widget get view {
    return Scaffold(
        key: globalKey,
        body: ControlledWidgetBuilder<akun_register_controller>(
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
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 150.0),
                              child: Center(
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: new TextSpan(
                                        // Note: Styles for TextSpans must be explicitly defined.
                                        // Child text spans will inherit styles from parent
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: "Popins",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: "Keluar ",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: 'Masuk',
                                          ),
                                        ])),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Center(
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: "Popins",
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Warna.warnaAbu,
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  child: new FormBuilderTextField(
                                    name: "name",
                                    decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      labelText: "Nama",
                                      fillColor: Colors.grey,
                                      focusColor: Colors.grey,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(width: 1),
                                      ),
                                      //fillColor: Colors.green
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Warna.warnaAbu,
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  child: new FormBuilderTextField(
                                    name: "email",
                                    decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      labelText: "Email",
                                      fillColor: Colors.grey,
                                      focusColor: Colors.grey,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(width: 1),
                                      ),
                                      //fillColor: Colors.green
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.email(context),
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Warna.warnaAbu,
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                  ),
                                  child: new FormBuilderTextField(
                                    name: "password",
                                    obscureText: true,
                                    decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      labelText: "Password",
                                      fillColor: Colors.grey,
                                      focusColor: Colors.grey,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(width: 1),
                                      ),
                                      //fillColor: Colors.green
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: InkWell(
                                  onTap: controller.registerUser,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Warna.warnaUtama,
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            "Konfirm",
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
                        ),
                      ],
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
