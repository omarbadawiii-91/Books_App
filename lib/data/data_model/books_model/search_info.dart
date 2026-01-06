import 'package:collection/collection.dart';

class SearchInfo {
  String? textSnippet;

  SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      SearchInfo(textSnippet: json['textSnippet'] as String?);

  Map<String, dynamic> toJson() => {'textSnippet': textSnippet};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SearchInfo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => textSnippet.hashCode;
}
