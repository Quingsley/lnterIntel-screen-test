import 'package:flutter/material.dart';

final List<Color> colors = [
  Colors.green,
  Colors.blue,
];

enum ShirtSize { small, medium, large, extraLarge, extraExtraLarge }

String getColorName(Color c) => c == Colors.blue ? 'blue' : 'green';

String getSizeName(ShirtSize s) {
  return switch (s) {
    ShirtSize.small => 'small',
    ShirtSize.medium => 'medium',
    ShirtSize.large => 'large',
    ShirtSize.extraLarge => 'extra large',
    ShirtSize.extraExtraLarge => 'extra extra large',
  };
}
