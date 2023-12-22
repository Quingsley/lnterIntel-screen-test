import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/utils/constants.dart';

// using state provider to keep things simple
final selectedColors = StateProvider<List<Color?>>((ref) => []);
final selectedSizes = StateProvider<List<ShirtSize?>>((ref) => []);
final userSelectedCombinations = StateProvider<List<String>>((ref) => []);
final combinations =
    NotifierProvider<Combinations, List<String>>(() => Combinations());

class Combinations extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

//logic to generate combinations
  void combinations(List<Color?> colors, List<ShirtSize?> sizes) {
    state = colors
        .expand((colors) => sizes
            .map((size) => '${getSizeName(size!)} / ${getColorName(colors!)}'))
        .toList();
  }

  void removeCombination(String value) {
    state = state.where((c) => c != value).toList();
  }
}
