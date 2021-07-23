import 'dart:convert';

/// A user of the application.
class UserAplikasi {
  String name = "";

  String email = "";

  String password = "";
  
  String id = "";
  
  UserAplikasi({
    this.name = "",
    this.email = "",
    this.password = "",
    this.id = "",
  });

  UserAplikasi copyWith({
    String? name,
    String? email,
    String? password,
    String? id,
  }) {
    return UserAplikasi(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
    };
  }

  factory UserAplikasi.fromMap(Map<String, dynamic> map) {
    return UserAplikasi(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAplikasi.fromJson(String source) =>
      UserAplikasi.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserAplikasi(name: $name, email: $email, password: $password, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserAplikasi &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      id.hashCode;
  }
}
