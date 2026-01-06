import 'package:collection/collection.dart';

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  String? buyLink;

  SaleInfo({this.country, this.saleability, this.isEbook, this.buyLink});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json['country'] as String?,
    saleability: json['saleability'] as String?,
    isEbook: json['isEbook'] as bool?,
    buyLink: json['buyLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
    'buyLink': buyLink,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SaleInfo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      country.hashCode ^
      saleability.hashCode ^
      isEbook.hashCode ^
      buyLink.hashCode;
}
