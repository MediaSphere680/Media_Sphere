import 'package:flutter/material.dart';

class ModuleScreen extends StatelessWidget {
  final String title;

  const ModuleScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Welcome to the $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
