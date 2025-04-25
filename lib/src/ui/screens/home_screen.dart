import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'explore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;
  static const _tabs = [
    ExploreScreen(),
    Center(child: Text('My Plants\n(TODO)', textAlign: TextAlign.center)),
    Center(child: Text('Settings\n(TODO)', textAlign: TextAlign.center)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_idx],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
      ),
    );
  }
}
