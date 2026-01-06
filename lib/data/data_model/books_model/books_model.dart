import 'package:collection/collection.dart';

import 'item.dart';

class BooksModel {
  String? kind;
  int? totalItems;
  List<Item>? items;

  BooksModel({this.kind, this.totalItems, this.items});

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    kind: json['kind'] as String?,
    totalItems: json['totalItems'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'totalItems': totalItems,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BooksModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => kind.hashCode ^ totalItems.hashCode ^ items.hashCode;
}
