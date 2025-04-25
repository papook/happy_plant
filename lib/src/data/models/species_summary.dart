import 'species_image.dart';

class SpeciesSummary {
  final int id;
  final String? commonName;
  final List<String> scientificName;
  final List<String> otherName;
  final String? family;
  final String? hybrid;
  final String? authority;
  final String? subspecies;
  final String? cultivar;
  final String? variety;
  final String? speciesEpithet;
  final String? genus;
  final SpeciesImage defaultImage;

  SpeciesSummary({
    required this.id,
    this.commonName,
    required this.scientificName,
    required this.otherName,
    this.family,
    this.hybrid,
    this.authority,
    this.subspecies,
    this.cultivar,
    this.variety,
    this.speciesEpithet,
    this.genus,
    required this.defaultImage,
  });

  factory SpeciesSummary.fromJson(Map<String, dynamic> json) {
    List<String> toStringList(dynamic raw) =>
        (raw as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];
    final imgJson = json['default_image'] as Map<String, dynamic>?;

    return SpeciesSummary(
      id: json['id'] as int? ?? 0,
      commonName: json['common_name'] as String?,
      scientificName: toStringList(json['scientific_name']),
      otherName: toStringList(json['other_name']),
      family: json['family'] as String?,
      hybrid: json['hybrid'] as String?,
      authority: json['authority'] as String?,
      subspecies: json['subspecies'] as String?,
      cultivar: json['cultivar'] as String?,
      variety: json['variety'] as String?,
      speciesEpithet: json['species_epithet'] as String?,
      genus: json['genus'] as String?,
      defaultImage: SpeciesImage.fromJson(imgJson),
    );
  }
}
