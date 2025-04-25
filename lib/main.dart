import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/ui/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: PlantCareApp()));
}

class PlantCareApp extends ConsumerWidget {
  const PlantCareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Happy Plant',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
      // TODO: add named routes for detail screen if desired
    );
  }
}
