import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'pages/landing_page.dart';

class MediaSphereApp extends StatelessWidget {
  const MediaSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const LandingPage(),
    );
  }
}
