import 'package:flutter/material.dart';
import 'package:flutter_uni_link/blue_screen.dart';
import 'package:flutter_uni_link/red_screen.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
          horizontal: 30,
        ),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BlueScreen(),
              ),
            ),
            child: const Text('Blue Screen'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const RedScreen(),
              ),
            ),
            child: const Text('Red Screen'),
          ),
        ],
      ),
    );
  }
}
