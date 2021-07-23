import 'dart:convert';

import 'package:flutter/foundation.dart';

class FilterAbsensi {
  int dateFrom;
  int dateTo;
  FilterAbsensi({
    required this.dateFrom,
    required this.dateTo,
  });

  FilterAbsensi copyWith({
    int? dateFrom,
    int? dateTo,
  }) {
    return FilterAbsensi(
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateFrom': dateFrom,
      'dateTo': dateTo,
    };
  }

  factory FilterAbsensi.fromMap(Map<String, dynamic> map) {
    return FilterAbsensi(
      dateFrom: map['dateFrom'],
      dateTo: map['dateTo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterAbsensi.fromJson(String source) =>
      FilterAbsensi.fromMap(json.decode(source));

  @override
  String toString() => 'FilterAbsensi(dateFrom: $dateFrom, dateTo: $dateTo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FilterAbsensi &&
        other.dateFrom == dateFrom &&
        other.dateTo == dateTo;
  }

  @override
  int get hashCode => dateFrom.hashCode ^ dateTo.hashCode;
}
