import 'package:flutter/material.dart';

class Gaya {
  static InputDecoration inputStandar(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black54),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
      ),
    );
  }
}
