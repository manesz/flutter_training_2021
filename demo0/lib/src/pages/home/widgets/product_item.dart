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
        children: [Text("top: "), Text("bottom: ")],
      ),
    );
  }
}
