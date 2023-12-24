import 'package:flutter/material.dart';

// A widget that displays the product information (name, description, price)
class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Chip(
                avatar: Icon(Icons.check_circle_outline),
                label: Text('T-Shirt')),
          ),
          Expanded(
              child:
                  Chip(avatar: Icon(Icons.attach_money), label: Text('25.00'))),
          Expanded(
            child: Chip(
                avatar: Icon(Icons.description_outlined),
                label: Text('Woolen')),
          ),
        ],
      ),
    );
  }
}
