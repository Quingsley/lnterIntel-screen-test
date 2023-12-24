import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';
import 'package:inter_intel_interview_test/constants/constants.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

// provides the two multi-select chip fields
class FormFields extends ConsumerWidget {
  const FormFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var colorStateProvider = ref.watch(selectedColorsProvider);
    var sizeStateProvider = ref.watch(selectedSizesProvider);
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
            ref
                .read(selectedColorsProvider.notifier)
                .state
                .clear(); // clear the state
            ref
                .read(selectedColorsProvider.notifier)
                .state
                .addAll(values); // add all selected colors
            if (sizeStateProvider.isNotEmpty) {
              // check if the size state is not empty
              ref.read(combinationsProvider.notifier).generateCombinations(
                  colorStateProvider,
                  sizeStateProvider); // generate the combinations
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
            // similar to what I did with the color options
            ref.read(selectedSizesProvider.notifier).state.clear();
            ref.read(selectedSizesProvider.notifier).state.addAll(values);
            if (colorStateProvider.isNotEmpty) {
              ref
                  .read(combinationsProvider.notifier)
                  .generateCombinations(colorStateProvider, sizeStateProvider);
            }
          },
        )
      ],
    );
  }
}
