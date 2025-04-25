class SpeciesImage {
  final int? imageId;
  final int? license;
  final String licenseName;
  final String licenseUrl;
  final String originalUrl;
  final String regularUrl;
  final String mediumUrl;
  final String smallUrl;
  final String thumbnail;

  const SpeciesImage({
    this.imageId,
    this.license,
    required this.licenseName,
    required this.licenseUrl,
    required this.originalUrl,
    required this.regularUrl,
    required this.mediumUrl,
    required this.smallUrl,
    required this.thumbnail,
  });

  /// Accepts a nullable JSON map. Returns a placeholder if null.
  factory SpeciesImage.fromJson(Map<String, dynamic>? json) {
    const placeholder = 'https://your.cdn.com/placeholder.png';
    if (json == null) {
      return const SpeciesImage(
        imageId: null,
        license: null,
        licenseName: '',
        licenseUrl: '',
        originalUrl: placeholder,
        regularUrl: placeholder,
        mediumUrl: placeholder,
        smallUrl: placeholder,
        thumbnail: placeholder,
      );
    }
    return SpeciesImage(
      imageId: json['image_id'] as int?,
      license: json['license'] as int?,
      licenseName: (json['license_name'] as String?) ?? '',
      licenseUrl: (json['license_url'] as String?) ?? '',
      originalUrl: (json['original_url'] as String?) ?? placeholder,
      regularUrl: (json['regular_url'] as String?) ?? placeholder,
      mediumUrl: (json['medium_url'] as String?) ?? placeholder,
      smallUrl: (json['small_url'] as String?) ?? placeholder,
      thumbnail: (json['thumbnail'] as String?) ?? placeholder,
    );
  }
}
