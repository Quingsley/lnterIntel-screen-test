import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inter_intel_interview_test/widgets/expansion_tile_card.dart';
import 'package:inter_intel_interview_test/widgets/form_fields.dart';
import 'package:inter_intel_interview_test/widgets/generated_variants.dart';
import 'package:inter_intel_interview_test/widgets/image_container.dart';
import 'package:inter_intel_interview_test/widgets/options_cta.dart';
import 'package:inter_intel_interview_test/widgets/product_info.dart';

class AddProduct extends ConsumerWidget {
  const AddProduct({super.key, required this.title});
  final String title;
  final _gap = const SizedBox(height: 4);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              _gap,
              const ProductInfo(),
              _gap,
              const VariantCheckBoxText(),
              _gap,
              const FormFields(),
              _gap,
              const TileCard(child: GeneratedVariants()),
            ],
          ),
        ),
      ),
    );
  }
}
