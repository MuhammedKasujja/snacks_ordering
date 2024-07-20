import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension Animateted on Widget {
  Animate animatedLeft([int milliseconds = 150]) {
    return animate().custom(
      delay: const Duration(milliseconds: 100),
      duration: Duration(milliseconds: milliseconds),
      builder: (context, value, child) => Transform.translate(
        offset: Offset(-200 + (200 * value), 0),
        child: Opacity(
          opacity: value,
          child: child,
        ),
      ),
    );
  }

  Animate animatedRight() {
    return animate().custom(
      delay: const Duration(milliseconds: 100),
      duration: 150.ms,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(200 - (200 * value), 0),
        child: Opacity(
          opacity: value,
          child: child,
        ),
      ),
    );
  }

  Animate animatedBack([int milliseconds = 150]) {
    return animate().custom(
      delay: Duration(milliseconds: milliseconds),
      duration: 150.ms,
      builder: (context, value, child) => Transform.scale(
        scale: value, // Scale from 0 to 1
        child: Opacity(
          opacity: value, // Fade in from 0 to 1
          child: child,
        ),
      ),
    );
  }

  Animate animatedBottom([int milliseconds = 150]) {
    return animate().custom(
      delay: Duration(milliseconds: milliseconds),
      duration: 150.ms,
      builder: (context, value, child) => Transform.translate(
        // Move from 100 pixels below to the original position
        offset: Offset(0, 100 * (1 - value)),
        child: Transform.scale(
          scale: 0.8 + 0.2 * value, // Scale from 0.8 to 1.0
          child: Opacity(
            opacity: value, // Start fully transparent and become fully opaque
            child: child,
          ),
        ),
      ),
    );
  }
}
