import 'package:flutter/material.dart';

class ShoppingListItem with ChangeNotifier {
  final int id;
  final String productName;
  final String? productType;
  final int? quantity;
  final double? weight;

  ShoppingListItem({
    required this.id,
    required this.productName,
    this.productType,
    this.quantity,
    this.weight,
  });
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': productName,
      'quantity': quantity,
      'weight': weight,
      'type': productType
    };
  }
}
