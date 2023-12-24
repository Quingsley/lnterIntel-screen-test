import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';

// provides an expansion tile card widget
class TileCard extends ConsumerWidget {
  final Widget child;
  const TileCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var combinations = ref.watch(combinationsProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(top: 4.0),
      child: ExpansionTileCard(
        elevation: 5,
        shadowColor: Theme.of(context).colorScheme.primary,
        expandedColor: Theme.of(context).colorScheme.inversePrimary,
        baseColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Icon(
          Icons.edit,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          'Select Variants',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        subtitle: const Text('Add variants to your product'),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: combinations.isEmpty ? 20 : 250.0,
            child: child,
          ),
        ],
      ),
    );
  }
}
