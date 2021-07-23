import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keluarmasuk/app/display/InfoAbsensiDisplay.dart';
import 'package:keluarmasuk/app/utils/Warna.dart';

class RowAbsensi extends StatelessWidget {
  final InfoAbsensiDisplay theAbsensiDisplay;
  const RowAbsensi({
    Key? key,
    required this.theAbsensiDisplay,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.5,
              spreadRadius: 2.0,
              offset: Offset(
                0,
                0,
              ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Center(
                      child: FaIcon(FontAwesomeIcons.user,
                          size: 20, color: Warna.warnaBiru),
                    ),
                  ),
                  Text(
                    "${theAbsensiDisplay.theAbsensi.theUser!.name}",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Popins",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.calendar,
                            size: 20, color: Warna.warnaBiru),
                      ),
                    ),
                    Text(
                      "${theAbsensiDisplay.labelAbsenIn}",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: "Popins",
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Center(
                              child: FaIcon(FontAwesomeIcons.signInAlt,
                                  size: 20, color: Warna.warnaBiru),
                            ),
                          ),
                          Text(
                            "${theAbsensiDisplay.labelJamAbsenIn}",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "Popins",
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Center(
                            child: FaIcon(FontAwesomeIcons.signOutAlt,
                                size: 20, color: Warna.warnaBiru),
                          ),
                        ),
                        Text(
                          "${theAbsensiDisplay.labelJamAbsenOut}",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "Popins",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.clock,
                            size: 20, color: Warna.warnaBiru),
                      ),
                    ),
                    Text(
                      "${theAbsensiDisplay.labelLamaKerja}",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: "Popins",
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
