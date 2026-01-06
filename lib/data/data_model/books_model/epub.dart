import 'package:collection/collection.dart';

class Epub {
  bool? isAvailable;
  String? downloadLink;

  Epub({this.isAvailable, this.downloadLink});

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
    isAvailable: json['isAvailable'] as bool?,
    downloadLink: json['downloadLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'isAvailable': isAvailable,
    'downloadLink': downloadLink,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Epub) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => isAvailable.hashCode ^ downloadLink.hashCode;
}
