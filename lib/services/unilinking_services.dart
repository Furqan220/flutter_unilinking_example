import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uni_link/blue_screen.dart';
import 'package:flutter_uni_link/red_screen.dart';
import 'package:flutter_uni_link/services/context_utiltiy.dart';

class UniversalLinkingServices {
  static late AppLinks appLinks; // AppLinks is singleton

  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static String? receivedCode;

  static init() async {
    try {
      appLinks = AppLinks();
      final Uri? uri = await appLinks.getInitialLink();
      uriHandler(uri);
    } on PlatformException {
      log('Platform error occured at uni link init');
    } on FormatException {
      log('FormatException error occured at uni link init');
    }

    appLinks.uriLinkStream.listen((uri) {
      uriHandler(uri);
      log('uriLinkStream recieved $uri');
    }, onError: (e) {
      log('error occured uriLinkStream  $e');
    });
  }

  static uriHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, dynamic> param = uri.queryParameters;

    receivedCode = param['code'] ?? '';

    if (receivedCode == 'blue') {
      Navigator.push(
          ContextUtility.context!,
          MaterialPageRoute(
            builder: (_) => const BlueScreen(),
          ));
    } else if (receivedCode == 'red') {
      Navigator.push(
          ContextUtility.context!,
          MaterialPageRoute(
            
            builder: (_) => const RedScreen(),
          ));
    }
  }
}
