import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';

class VariantCheckBoxText extends ConsumerWidget {
  const VariantCheckBoxText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isChecked = ref.watch(isCheckedState);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Checkbox(
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              value: isChecked,
              onChanged: (value) {
                ref.read(isCheckedState.notifier).state = value!;
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
