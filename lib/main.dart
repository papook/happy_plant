import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happy_plant/src/ui/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: PlantCareApp()));
}

class PlantCareApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Happy Plant',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
      // TODO: add named routes for detail screen
    );
  }
}
