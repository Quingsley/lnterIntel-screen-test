import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';

class GeneratedVariants extends ConsumerWidget {
  const GeneratedVariants({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedCombinations =
        ref.watch(userSelectedCombinations); // will store what the user selects
    var generatedCombinations =
        ref.watch(combinations); // generated combinations

    return generatedCombinations.isEmpty
        ? Text(
            'No options selected yet',
            style: Theme.of(context).textTheme.bodySmall,
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => CheckboxListTile(
                    activeColor: Theme.of(context).colorScheme.primary,
                    selectedTileColor: Theme.of(context).colorScheme.primary,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      generatedCombinations[index],
                    ),
                    value: selectedCombinations
                        .contains(generatedCombinations[index]),
                    subtitle: const Text('Price: \$${25.00}'),
                    secondary: IconButton(
                        onPressed: () =>
                            ref.read(combinations.notifier).removeCombination(
                                  generatedCombinations[index],
                                ),
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.error,
                        )),
                    onChanged: (bool? value) {
                      if (value == true) {
                        ref
                            .read(userSelectedCombinations.notifier)
                            .add(generatedCombinations[index]);
                      } else {
                        ref
                            .read(userSelectedCombinations.notifier)
                            .remove(generatedCombinations[index]);
                      }
                    },
                  ),
                  itemCount: generatedCombinations.length,
                ),
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    ref.read(isCheckedState.notifier).state = false;
                    ref.read(selectedColors.notifier).state = [];
                    ref.read(selectedSizes.notifier).state = [];
                    ref.read(combinations.notifier).clear();
                  },
                  label: Text(
                    'Save',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  icon: const Icon(Icons.save))
            ],
          );
  }
}
