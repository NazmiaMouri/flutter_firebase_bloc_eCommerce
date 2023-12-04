import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/product_tile.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5,
            childAspectRatio: .7),
        itemBuilder: (_, int index) {
          return Product();
        });
  }
}
