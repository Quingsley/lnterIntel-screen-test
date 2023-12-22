import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';
import 'package:inter_intel_interview_test/utils/constants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class FormFields extends ConsumerWidget {
  const FormFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorStateProvider = ref.watch(selectedColors);
    var sizeStateProvider = ref.watch(selectedSizes);
    return Column(
      children: [
        MultiSelectChipField<Color?>(
          headerColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Select colors'),
          items: colors
              .map((c) => MultiSelectItem<Color?>(
                    c,
                    getColorName(c).toUpperCase(),
                  ))
              .toList(),
          onTap: (values) {
            ref.read(selectedColors.notifier).state.clear();
            ref.read(selectedColors.notifier).state.addAll(values);
            if (sizeStateProvider.isNotEmpty) {
              ref
                  .read(combinations.notifier)
                  .combinations(colorStateProvider, sizeStateProvider);
            }
          },
        ),
        const SizedBox(
          height: 4,
        ),
        MultiSelectChipField<ShirtSize?>(
          headerColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Select sizes'),
          items: ShirtSize.values
              .map((s) => MultiSelectItem<ShirtSize?>(s, s.name))
              .toList(),
          onTap: (values) {
            ref.read(selectedSizes.notifier).state.clear();
            ref.read(selectedSizes.notifier).state.addAll(values);
            if (colorStateProvider.isNotEmpty) {
              ref
                  .read(combinations.notifier)
                  .combinations(colorStateProvider, sizeStateProvider);
            }
          },
        )
      ],
    );
  }
}
