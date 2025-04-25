import 'package:flutter/material.dart';
import '../../data/models/species_summary.dart';

/// A 2×card thumbnail with image, name, up to 5 care icons
class PlantCard extends StatelessWidget {
  final SpeciesSummary plant;
  final List<IconData> careIcons;

  const PlantCard({required this.plant, required this.careIcons, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: plant.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                plant.defaultImage.mediumUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                plant.commonName ?? plant.scientificName?.first ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  careIcons
                      .take(5)
                      .map(
                        (ic) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(ic, size: 16),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
