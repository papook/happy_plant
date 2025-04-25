import 'species_summary.dart';

class SpeciesListResponse {
  final List<SpeciesSummary> data;
  final int to;
  final int perPage;
  final int currentPage;
  final int from;
  final int lastPage;
  final int total;

  SpeciesListResponse({
    required this.data,
    required this.to,
    required this.perPage,
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.total,
  });

  factory SpeciesListResponse.fromJson(Map<String, dynamic> json) {
    // Safely read data array
    final raw = json['data'] as List<dynamic>? ?? [];
    final parsed =
        raw
            .whereType<Map<String, dynamic>>() // only maps
            .map(SpeciesSummary.fromJson)
            .toList();

    return SpeciesListResponse(
      data: parsed,
      to: json['to'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      currentPage: json['current_page'] as int? ?? 0,
      from: json['from'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );
  }
}
