import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/constants/constants.dart';

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

  void clear() {
    state = [];
  }
}
