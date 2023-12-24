import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/constants/constants.dart';
import 'package:inter_intel_interview_test/providers/generated_combinations_provider.dart';
import 'package:inter_intel_interview_test/providers/user_selected_combinations_provder.dart';

// using state providers to keep things simple
final selectedColorsProvider = StateProvider<List<Color?>>((ref) => []);
final selectedSizesProvider = StateProvider<List<ShirtSize?>>((ref) => []);
final isCheckedStateProvider = StateProvider<bool>((ref) => false);

final combinationsProvider =
    NotifierProvider<Combinations, List<String>>(() => Combinations());

final userSelectedCombinationsProvider =
    NotifierProvider<UserSelectedCombinationsNotifier, List<String>>(
        () => UserSelectedCombinationsNotifier());
