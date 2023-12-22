import 'package:flutter/material.dart';

class VariantCheckBoxText extends StatefulWidget {
  const VariantCheckBoxText({super.key});

  @override
  State<VariantCheckBoxText> createState() => _VariantCheckBoxTextState();
}

class _VariantCheckBoxTextState extends State<VariantCheckBoxText> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Checkbox(
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
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
