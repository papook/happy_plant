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
    return SpeciesListResponse(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => SpeciesSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      to: json['to'] as int,
      perPage: json['per_page'] as int,
      currentPage: json['current_page'] as int,
      from: json['from'] as int,
      lastPage: json['last_page'] as int,
      total: json['total'] as int,
    );
  }
}
