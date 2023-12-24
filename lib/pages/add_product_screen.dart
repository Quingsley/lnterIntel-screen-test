import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/providers/providers.dart';
import 'package:inter_intel_interview_test/widgets/expansion_tile_card.dart';
import 'package:inter_intel_interview_test/widgets/form_fields.dart';
import 'package:inter_intel_interview_test/widgets/generated_variants.dart';
import 'package:inter_intel_interview_test/widgets/image_container.dart';
import 'package:inter_intel_interview_test/widgets/options_cta.dart';
import 'package:inter_intel_interview_test/widgets/product_info.dart';
import 'package:inter_intel_interview_test/widgets/user_variant_card.dart';

class AddProduct extends ConsumerWidget {
  const AddProduct({super.key, required this.title});
  final String title;
  final _gap = const SizedBox(height: 4);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isChecked = ref.watch(isCheckedStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const ImageContainer(),
              if (!isChecked) _gap,
              if (!isChecked) const ProductInfo(),
              _gap,
              const UserVariantsCard(),
              _gap,
              const VariantCheckBoxText(),
              _gap,
              if (isChecked) const FormFields(),
              if (isChecked) _gap,
              if (isChecked) const TileCard(child: GeneratedVariants()),
            ],
          ),
        ),
      ),
    );
  }
}
