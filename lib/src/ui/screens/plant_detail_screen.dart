import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../blocs/plant_detail/plant_detail_provider.dart';

class PlantDetailScreen extends ConsumerWidget {
  const PlantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final plantAsync = ref.watch(plantDetailProvider(id));

    return Scaffold(
      appBar: AppBar(title: const Text('Plant Details')),
      body: plantAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (plant) {
          final info = <String, dynamic>{
            'Common Name': plant.commonName,
            'Scientific Name': plant.scientificName.join(', '),
            // …all other non-list fields…
          };
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.network(plant.defaultImage.originalUrl),
              const SizedBox(height: 16),
              ...info.entries
                  .where(
                    (e) => e.value != null && e.value.toString().isNotEmpty,
                  )
                  .map(
                    (e) => ListTile(
                      title: Text(e.key),
                      subtitle: Text(e.value.toString()),
                    ),
                  ),
              // TODO: carousel for otherImages, xWatering*, etc.
            ],
          );
        },
      ),
    );
  }
}
