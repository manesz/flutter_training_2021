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
        children: [
          _buildImage(300),
          Text("bottom: ${product.price}"),
        ],
      ),
    );
  }

  Stack _buildImage(double maxHeight) {
    final height = maxHeight * 0.65;
    final image = product.image;
    final stock = product.stock;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: Container(
            color: Colors.red,
          ),
        ),
        if (stock <= 0) _buildOutOfStock(),
      ],
    );
  }

  Positioned _buildOutOfStock() => const Positioned(
        top: 2,
        right: 2,
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
