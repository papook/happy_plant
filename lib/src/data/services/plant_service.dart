import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/species_list_response.dart';
import '../models/plant_details.dart';
import '../models/species_summary.dart';

class PlantService {
  static const _host = 'perenual.com';
  static const _listPath = '/api/v2/species-list';
  static const _detailPath = '/api/v2/species/details';

  final String apiKey;
  final http.Client _http;

  PlantService({required this.apiKey, http.Client? httpClient})
    : _http = httpClient ?? http.Client();

  Future<SpeciesListResponse> fetchSpeciesList({
    int page = 1,
    String? query,
    String? order,
    bool? edible,
    bool? poisonous,
    String? cycle,
    String? watering,
    String? sunlight,
    bool? indoor,
    String? hardiness,
  }) async {
    final uri = Uri.https(_host, _listPath, {
      'key': apiKey,
      'page': '$page',
      if (query != null) 'q': query,
      if (order != null) 'order': order,
      if (edible != null) 'edible': edible ? '1' : '0',
      if (poisonous != null) 'poisonous': poisonous ? '1' : '0',
      if (cycle != null) 'cycle': cycle,
      if (watering != null) 'watering': watering,
      if (sunlight != null) 'sunlight': sunlight,
      if (indoor != null) 'indoor': indoor ? '1' : '0',
      if (hardiness != null) 'hardiness': hardiness,
    });

    final res = await _http.get(uri);
    if (res.statusCode != 200) {
      throw HttpException(
        'Error ${res.statusCode} fetching species list',
        uri: uri,
      );
    }
    final jsonMap = jsonDecode(res.body) as Map<String, dynamic>;
    return SpeciesListResponse.fromJson(jsonMap);
  }

  Future<PlantDetails> fetchPlantDetails(int id) async {
    final uri = Uri.https(_host, '$_detailPath/$id', {'key': apiKey});
    final res = await _http.get(uri);
    if (res.statusCode != 200) {
      throw HttpException(
        'Error ${res.statusCode} fetching plant details',
        uri: uri,
      );
    }
    final jsonMap = jsonDecode(res.body) as Map<String, dynamic>;
    return PlantDetails.fromJson(jsonMap);
  }

  void dispose() => _http.close();
}

class HttpException implements Exception {
  final String message;
  final Uri? uri;
  HttpException(this.message, {this.uri});
  @override
  String toString() => uri == null ? message : '$message\nURI: $uri';
}
