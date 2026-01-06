import 'package:collection/collection.dart';

import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo {
  String? title;
  String? publishedDate;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.publishedDate,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String?,
    publishedDate: json['publishedDate'] as String?,
    industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
        ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
        .toList(),
    readingModes: json['readingModes'] == null
        ? null
        : ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),
    pageCount: json['pageCount'] as int?,
    printType: json['printType'] as String?,
    categories: json['categories'] as List<String>?,
    maturityRating: json['maturityRating'] as String?,
    allowAnonLogging: json['allowAnonLogging'] as bool?,
    contentVersion: json['contentVersion'] as String?,
    panelizationSummary: json['panelizationSummary'] == null
        ? null
        : PanelizationSummary.fromJson(
            json['panelizationSummary'] as Map<String, dynamic>,
          ),
    imageLinks: json['imageLinks'] == null
        ? null
        : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    language: json['language'] as String?,
    previewLink: json['previewLink'] as String?,
    infoLink: json['infoLink'] as String?,
    canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'publishedDate': publishedDate,
    'industryIdentifiers': industryIdentifiers?.map((e) => e.toJson()).toList(),
    'readingModes': readingModes?.toJson(),
    'pageCount': pageCount,
    'printType': printType,
    'categories': categories,
    'maturityRating': maturityRating,
    'allowAnonLogging': allowAnonLogging,
    'contentVersion': contentVersion,
    'panelizationSummary': panelizationSummary?.toJson(),
    'imageLinks': imageLinks?.toJson(),
    'language': language,
    'previewLink': previewLink,
    'infoLink': infoLink,
    'canonicalVolumeLink': canonicalVolumeLink,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VolumeInfo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      title.hashCode ^
      publishedDate.hashCode ^
      industryIdentifiers.hashCode ^
      readingModes.hashCode ^
      pageCount.hashCode ^
      printType.hashCode ^
      categories.hashCode ^
      maturityRating.hashCode ^
      allowAnonLogging.hashCode ^
      contentVersion.hashCode ^
      panelizationSummary.hashCode ^
      imageLinks.hashCode ^
      language.hashCode ^
      previewLink.hashCode ^
      infoLink.hashCode ^
      canonicalVolumeLink.hashCode;
}
