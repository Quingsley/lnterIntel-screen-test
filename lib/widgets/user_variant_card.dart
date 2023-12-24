import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';

// This  widget will display the variants that the user has selected and saved
class UserVariantsCard extends ConsumerWidget {
  const UserVariantsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedVariants = ref.watch(userSelectedCombinationsProvider);
    return Container(
      height: selectedVariants.isEmpty ? 0 : 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text('Product Variants',
              style: Theme.of(context).textTheme.headlineMedium),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(selectedVariants[index]),
                trailing: const Text('\$ 25.00'),
              ),
              itemCount: selectedVariants.length,
            ),
          ),
        ],
      ),
    );
  }
}
