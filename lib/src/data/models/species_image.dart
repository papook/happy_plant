class SpeciesImage {
  final int imageId;
  final int license;
  final String licenseName;
  final String licenseUrl;
  final String originalUrl;
  final String regularUrl;
  final String mediumUrl;
  final String smallUrl;
  final String thumbnail;

  SpeciesImage({
    required this.imageId,
    required this.license,
    required this.licenseName,
    required this.licenseUrl,
    required this.originalUrl,
    required this.regularUrl,
    required this.mediumUrl,
    required this.smallUrl,
    required this.thumbnail,
  });

  factory SpeciesImage.fromJson(Map<String, dynamic> json) {
    return SpeciesImage(
      imageId: json['image_id'] as int,
      license: json['license'] as int,
      licenseName: json['license_name'] as String,
      licenseUrl: json['license_url'] as String,
      originalUrl: json['original_url'] as String,
      regularUrl: json['regular_url'] as String,
      mediumUrl: json['medium_url'] as String,
      smallUrl: json['small_url'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
