import 'package:flutter/material.dart';

final List<String> _images = [
  'assets/images/t-shirt-1.webp',
  'assets/images/t-shirt-2.webp'
];

// simple widget to display the images of an already added product
class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});
  final double _height = 150;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _images.map((image) {
        return Expanded(
          child: Container(
            height: _height,
            margin: const EdgeInsets.only(right: 6, left: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                color: Theme.of(context).colorScheme.primary.withOpacity(.2),
                colorBlendMode: BlendMode.srcATop,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
