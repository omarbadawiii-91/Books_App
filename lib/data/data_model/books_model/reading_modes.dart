import 'package:collection/collection.dart';

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      ReadingModes(text: json['text'] as bool?, image: json['image'] as bool?);

  Map<String, dynamic> toJson() => {'text': text, 'image': image};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ReadingModes) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => text.hashCode ^ image.hashCode;
}
