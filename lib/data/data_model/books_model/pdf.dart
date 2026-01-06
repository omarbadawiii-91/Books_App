import 'package:collection/collection.dart';

class Pdf {
  bool? isAvailable;
  String? downloadLink;

  Pdf({this.isAvailable, this.downloadLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
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
    if (other is! Pdf) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => isAvailable.hashCode ^ downloadLink.hashCode;
}
