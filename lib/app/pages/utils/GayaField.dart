import 'package:flutter/material.dart';

class GayaField {
  static InputDecoration miniWhite({String? hint}) {
    return new InputDecoration(
      contentPadding: EdgeInsets.all(8),
      hintText: hint,
      fillColor: Colors.grey,
      focusColor: Colors.grey,
      focusedBorder: OutlineInputBorder(
        borderRadius: new BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: new BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.0),
      ),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(20.0),
        borderSide: new BorderSide(width: 1),
      ),
      //fillColor: Colors.green
    );
  }

  static InputDecoration abu(String? label) {
    return new InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      labelText: label,
      fillColor: Colors.grey,
      focusColor: Colors.grey,
      focusedBorder: OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.0),
      ),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: new BorderSide(width: 1),
      ),
      //fillColor: Colors.green
    );
  }
}
