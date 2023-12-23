import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/constants/constants.dart';
import 'package:inter_intel_interview_test/providers/generated_combinations_provider.dart';
import 'package:inter_intel_interview_test/providers/user_selected_combinations_provder.dart';

// using state provider to keep things simple
final selectedColors = StateProvider<List<Color?>>((ref) => []);
final selectedSizes = StateProvider<List<ShirtSize?>>((ref) => []);
final isCheckedState = StateProvider<bool>((ref) => false);
final combinations =
    NotifierProvider<Combinations, List<String>>(() => Combinations());

final userSelectedCombinations =
    NotifierProvider<UserSelectedCombinationsNotifier, List<String>>(
        () => UserSelectedCombinationsNotifier());
