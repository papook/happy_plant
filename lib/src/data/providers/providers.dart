import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/plant_service.dart';

/// Makes PlantService available throughout the app
final plantServiceProvider = Provider<PlantService>((ref) {
  return PlantService(apiKey: ''); // TODO: secure key
});
