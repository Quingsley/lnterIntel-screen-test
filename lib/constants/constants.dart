import 'package:flutter/material.dart';

// color options
final List<Color> colors = [
  Colors.green,
  Colors.blue,
];

enum ShirtSize { small, medium, large, extraLarge, extraExtraLarge }

// method to get the color name
String getColorName(Color c) => c == Colors.blue ? 'blue' : 'green';

// method to get the size name
String getSizeName(ShirtSize s) {
  return switch (s) {
    ShirtSize.small => 'Small',
    ShirtSize.medium => 'Medium',
    ShirtSize.large => 'large',
    ShirtSize.extraLarge => 'Extra-large',
    ShirtSize.extraExtraLarge => 'Extra-extra-large',
  };
}
