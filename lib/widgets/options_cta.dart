import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';

// this is a toggle button that minimizes the widgets displayed on the AddProduct screen
// to allow the user to focus on the task at hand (selecting options, color, size) and then selecting
// the variants they want to save
class VariantCheckBoxText extends ConsumerWidget {
  const VariantCheckBoxText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isChecked = ref.watch(isCheckedStateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Checkbox(
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              value: isChecked,
              onChanged: (value) {
                ref.read(isCheckedStateProvider.notifier).state = value!;
              }),
        ),
        const Expanded(
          flex: 6,
          child: Text(
            'This product has options such as size and color',
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
