import 'package:flutter/material.dart';

class SingleItemToSelect extends StatelessWidget {
  const SingleItemToSelect({Key? key, required this.productName})
      : super(key: key);
  final String productName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.shopping_cart_outlined),
        label: Text(productName));
  }
}
