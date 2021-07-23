import 'dart:convert';
import 'dart:io';

/// A user of the application.
class ViewUserSetting {
  bool viewPhoto;
  ViewUserSetting({
    this.viewPhoto = false,
  });

  ViewUserSetting copyWith({
    bool? viewPhoto,
  }) {
    return ViewUserSetting(
      viewPhoto: viewPhoto ?? this.viewPhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'viewPhoto': viewPhoto,
    };
  }

  factory ViewUserSetting.fromMap(Map<String, dynamic> map) {
    return ViewUserSetting(
      viewPhoto: map['viewPhoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ViewUserSetting.fromJson(String source) =>
      ViewUserSetting.fromMap(json.decode(source));

  @override
  String toString() => 'ViewUserSetting(viewPhoto: $viewPhoto)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ViewUserSetting && other.viewPhoto == viewPhoto;
  }

  @override
  int get hashCode => viewPhoto.hashCode;
}
