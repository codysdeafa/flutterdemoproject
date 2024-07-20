

import 'dart:ui';

extension ColorExtension on Color {
  
  String toHex({bool includeAlpha = false}) {
    final int alpha = this.alpha;
    final int red = this.red;
    final int green = this.green;
    final int blue = this.blue;
    if (includeAlpha) {
      return '#${alpha.toRadixString(16).padLeft(2, '0')}${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
    } else {
      return '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
    }
  }
}