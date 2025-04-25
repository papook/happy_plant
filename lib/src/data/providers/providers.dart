import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/plant_service.dart';

/// Makes PlantService available throughout the app
final plantServiceProvider = Provider<PlantService>((ref) {
  return PlantService(
    apiKey: 'sk-f0jX67fd3af1e39999786',
  ); // TODO: secure your key
});
