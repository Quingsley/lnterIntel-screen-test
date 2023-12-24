import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';

// This widget will display the generated variants and will allow users to select the variants they want to save or
// delete the variants they don't want to save
class GeneratedVariants extends ConsumerWidget {
  const GeneratedVariants({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedCombinations = ref.watch(
        userSelectedCombinationsProvider); // will store combinations that the user selects
    var generatedCombinations =
        ref.watch(combinationsProvider); // generated combinations

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
                        onPressed: () {
                          ref
                              .read(combinationsProvider.notifier)
                              .removeCombination(
                                generatedCombinations[index],
                              );
                          ref
                              .read(userSelectedCombinationsProvider.notifier)
                              .remove(generatedCombinations[index]);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.error,
                        )),
                    onChanged: (bool? value) {
                      if (value == true) {
                        // add the selected combination to the userSelectedCombinations state otherwise remove it
                        ref
                            .read(userSelectedCombinationsProvider.notifier)
                            .add(generatedCombinations[index]);
                      } else {
                        ref
                            .read(userSelectedCombinationsProvider.notifier)
                            .remove(generatedCombinations[index]);
                      }
                    },
                  ),
                  itemCount: generatedCombinations.length,
                ),
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    // clearing all the states
                    ref.read(isCheckedStateProvider.notifier).state = false;
                    ref.read(selectedColorsProvider.notifier).state = [];
                    ref.read(selectedSizesProvider.notifier).state = [];
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
