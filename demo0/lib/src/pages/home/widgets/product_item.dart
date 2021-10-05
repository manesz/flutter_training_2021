import 'package:demo0/src/models/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductItem({required this.product, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("top: ${product.name}"), Text("bottom: ${product.price}")],
      ),
    );
  }


  Positioned _buildOutOfStock() => Positioned(
    top: 2,
    right: 2,
    child: Card(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          'out of stock',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    ),
  );
}
