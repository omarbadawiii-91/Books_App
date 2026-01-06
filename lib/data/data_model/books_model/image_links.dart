import 'package:collection/collection.dart';

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json['smallThumbnail'] as String?,
    thumbnail: json['thumbnail'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'smallThumbnail': smallThumbnail,
    'thumbnail': thumbnail,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ImageLinks) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => smallThumbnail.hashCode ^ thumbnail.hashCode;
}
