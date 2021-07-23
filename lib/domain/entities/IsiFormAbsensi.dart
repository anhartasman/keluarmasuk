import 'dart:convert';

import 'package:flutter/foundation.dart';
 
class IsiFormAbsensi {
  int timestampAbsensi;
  String jenisAbsen;
  String userId;
  IsiFormAbsensi({
    required this.timestampAbsensi,
    required this.jenisAbsen,
    required this.userId,
  });
  

  IsiFormAbsensi copyWith({
    int? timestampAbsensi,
    String? jenisAbsen,
    String? userId,
  }) {
    return IsiFormAbsensi(
      timestampAbsensi: timestampAbsensi ?? this.timestampAbsensi,
      jenisAbsen: jenisAbsen ?? this.jenisAbsen,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestampAbsensi': timestampAbsensi,
      'jenisAbsen': jenisAbsen,
      'userId': userId,
    };
  }

  factory IsiFormAbsensi.fromMap(Map<String, dynamic> map) {
    return IsiFormAbsensi(
      timestampAbsensi: map['timestampAbsensi'],
      jenisAbsen: map['jenisAbsen'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory IsiFormAbsensi.fromJson(String source) => IsiFormAbsensi.fromMap(json.decode(source));

  @override
  String toString() => 'IsiFormAbsensi(timestampAbsensi: $timestampAbsensi, jenisAbsen: $jenisAbsen, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is IsiFormAbsensi &&
      other.timestampAbsensi == timestampAbsensi &&
      other.jenisAbsen == jenisAbsen &&
      other.userId == userId;
  }

  @override
  int get hashCode => timestampAbsensi.hashCode ^ jenisAbsen.hashCode ^ userId.hashCode;
}
