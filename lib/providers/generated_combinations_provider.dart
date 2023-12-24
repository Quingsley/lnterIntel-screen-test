import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/constants/constants.dart';

// This  class will maintain the state of the generated combinations of colors and sizes
// and notify the UI when there is a change
class Combinations extends Notifier<List<String>> {
  @override
  List<String> build() {
    return []; // initial state
  }

//logic to generate combinations of colors and sizes
  void generateCombinations(List<Color?> colors, List<ShirtSize?> sizes) {
    // I use expand to create a list of all the combinations of colors and sizes
    state = colors
        .expand((colors) => sizes
            .map((size) => '${getSizeName(size!)}/${getColorName(colors!)}'))
        .toList();
  }

//logic to remove a combination from the list of generated combinations
  void removeCombination(String value) {
    state = state.where((c) => c != value).toList();
  }

  void clear() {
    state = [];
  }
}
