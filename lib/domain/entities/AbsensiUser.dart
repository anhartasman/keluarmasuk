import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'UserAplikasi.dart';

class AbsensiUser {
  String id;
  int absenIn;
  int absenOut;
  int sedangIn;
  String userId;
  UserAplikasi? theUser;
  AbsensiUser({
    required this.id,
    required this.absenIn,
    required this.absenOut,
    required this.sedangIn,
    required this.userId,
    this.theUser,
  });

  AbsensiUser copyWith({
    String? id,
    int? absenIn,
    int? absenOut,
    int? sedangIn,
    String? userId,
    UserAplikasi? theUser,
  }) {
    return AbsensiUser(
      id: id ?? this.id,
      absenIn: absenIn ?? this.absenIn,
      absenOut: absenOut ?? this.absenOut,
      sedangIn: sedangIn ?? this.sedangIn,
      userId: userId ?? this.userId,
      theUser: theUser ?? this.theUser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'absenIn': absenIn,
      'absenOut': absenOut,
      'sedangIn': sedangIn,
      'userId': userId,
      'theUser': theUser?.toMap(),
    };
  }

  factory AbsensiUser.fromMap(Map<String, dynamic> map) {
    return AbsensiUser(
      id: map['id'],
      absenIn: map['absenIn'],
      absenOut: map['absenOut'],
      sedangIn: map['sedangIn'],
      userId: map['userId'],
      theUser: UserAplikasi.fromMap(map['theUser']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AbsensiUser.fromJson(String source) => AbsensiUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AbsensiUser(id: $id, absenIn: $absenIn, absenOut: $absenOut, sedangIn: $sedangIn, userId: $userId, theUser: $theUser)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AbsensiUser &&
      other.id == id &&
      other.absenIn == absenIn &&
      other.absenOut == absenOut &&
      other.sedangIn == sedangIn &&
      other.userId == userId &&
      other.theUser == theUser;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      absenIn.hashCode ^
      absenOut.hashCode ^
      sedangIn.hashCode ^
      userId.hashCode ^
      theUser.hashCode;
  }
}
