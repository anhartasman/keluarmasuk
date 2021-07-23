import 'dart:convert';

/// A user of the application.
class Respon {
  bool success = false;

  String error_code = "001";

  String error_msg;
  Respon({
    this.success = true,
    this.error_code = "000",
    this.error_msg = "",
  });

  Respon copyWith({
    bool? success,
    String? error_code,
    String? error_msg,
  }) {
    return Respon(
      success: success ?? this.success,
      error_code: error_code ?? this.error_code,
      error_msg: error_msg ?? this.error_msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'error_code': error_code,
      'error_msg': error_msg,
    };
  }

  factory Respon.fromMap(Map<String, dynamic> map) {
    return Respon(
      success: map['success'],
      error_code: map['error_code'],
      error_msg: map['error_msg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Respon.fromJson(String source) => Respon.fromMap(json.decode(source));

  @override
  String toString() =>
      'Respon(success: $success, error_code: $error_code, error_msg: $error_msg)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Respon &&
        other.success == success &&
        other.error_code == error_code &&
        other.error_msg == error_msg;
  }

  @override
  int get hashCode =>
      success.hashCode ^ error_code.hashCode ^ error_msg.hashCode;
}
