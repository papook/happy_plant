import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/providers/providers.dart';
import '../../data/models/plant_details.dart';

final plantDetailProvider = FutureProvider.family<PlantDetails, int>((ref, id) {
  final svc = ref.watch(plantServiceProvider);
  return svc.fetchPlantDetails(id);
});
