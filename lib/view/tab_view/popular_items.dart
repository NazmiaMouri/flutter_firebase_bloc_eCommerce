import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/product_list.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProductList(),
    );
  }
}
