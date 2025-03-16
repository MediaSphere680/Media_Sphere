import 'package:flutter/material.dart';

class ParallaxWidget extends StatelessWidget {
  final Widget child;

  const ParallaxWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 0.05),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value * 100),
          child: child,
        );
      },
      child: child,
    );
  }
}
