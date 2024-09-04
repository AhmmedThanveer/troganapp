import 'package:flutter/material.dart';

List<LinearGradient> gradients = [
  LinearGradient(
    colors: [Color(0xFF14C8C5), Color(0xFF83DFDF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  LinearGradient(
    colors: [Color(0xFFFFE58E), Color(0xFFFCDA70)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  LinearGradient(
    colors: [Color(0xFF512E7E), Color(0xFFA073DA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0852, 1.0],
    transform: GradientRotation(
        194.66 * (3.14159265358979323846264338327950288 / 180.0)),
  ),
  // Add more gradients if needed
];
final List<LinearGradient> backgroundGradients = [
  LinearGradient(
    colors: [Color(0xFFFFC1C1), Color(0xFFFA7373)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  LinearGradient(
    colors: [Color(0xFFFFE28E), Color(0xFFFFC44D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  LinearGradient(
    colors: [Color(0xFF76EFFF), Color(0xFF14D0F2)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  // Add more gradients if needed
];

// List of image URLs (or asset paths) and titles
final List<Map<String, String>> coursess = [
  {
    'icon': 'assets/images/book.png', // Replace with actual image asset or URL
    'title': 'Exam',
  },
  {
    'icon':
        'assets/images/download.png', // Replace with actual image asset or URL
    'title': 'Practice',
  },
  {
    'icon': 'assets/images/pdf.png', // Replace with actual image asset or URL
    'title': 'Materials',
  },
  // Add more items if needed
];
final List<Color> colorslist = [
  Color(0xFFFA7373),
  Color(0xFFFFC44D),
  Color(0xFF14D0F2)
];
