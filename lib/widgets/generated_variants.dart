import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';

class GeneratedVariants extends ConsumerStatefulWidget {
  const GeneratedVariants({super.key});

  @override
  ConsumerState<GeneratedVariants> createState() => _GeneratedVariantsState();
}

class _GeneratedVariantsState extends ConsumerState<GeneratedVariants> {
  final List<String> selectedCombinations = [];
  @override
  Widget build(
    BuildContext context,
  ) {
    var generatedCombinations = ref.watch(combinations);
    return generatedCombinations.isEmpty
        ? Text(
            'No options selected yet',
            style: Theme.of(context).textTheme.displaySmall,
          )
        : ListView.builder(
            itemBuilder: (context, index) => CheckboxListTile(
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              selectedTileColor: Theme.of(context).colorScheme.secondary,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                generatedCombinations[index],
              ),
              value:
                  selectedCombinations.contains(generatedCombinations[index]),
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
                setState(() {
                  if (value == true) {
                    selectedCombinations.add(generatedCombinations[index]);
                  } else {
                    selectedCombinations.remove(generatedCombinations[index]);
                  }
                });
              },
            ),
            itemCount: generatedCombinations.length,
          );
  }
}
