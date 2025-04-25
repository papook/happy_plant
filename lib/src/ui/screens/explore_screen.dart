import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../blocs/plant_list/plant_list_notifier.dart';
import '../widgets/plant_card.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 200) {
        ref.read(plantListProvider.notifier).fetchNext();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plantListProvider);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search plants',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (q) {
                // TODO: wire up search in notifier
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Watering'),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('All')),
                    ],
                    onChanged: (v) {
                      // TODO: filter
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Sunlight'),
                    items: const [
                      DropdownMenuItem(value: null, child: Text('All')),
                    ],
                    onChanged: (v) {
                      // TODO: filter
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              controller: _scroll,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.plants.length + (state.hasNext ? 1 : 0),
              itemBuilder: (_, i) {
                if (i < state.plants.length) {
                  final plant = state.plants[i];
                  return PlantCard(
                    plant: plant,
                    careIcons: const [Icons.opacity, Icons.wb_sunny, Icons.eco],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          if (state.isLoading && state.plants.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
