import 'package:flutter/material.dart';
import 'package:flutter_uni_link/blue_screen.dart';
import 'package:flutter_uni_link/index_screen.dart';
import 'package:flutter_uni_link/red_screen.dart';
import 'package:flutter_uni_link/services/context_utiltiy.dart';
import 'package:flutter_uni_link/services/unilinking_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UniversalLinkingServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      routes: {
        '/': (_) => IndexScreen(),
        '/blue': (_) => BlueScreen(),
        '/red': (_) => RedScreen(),
      },
    );
  }
}
