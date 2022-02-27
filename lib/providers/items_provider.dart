import 'package:flutter/cupertino.dart';
import 'package:lista_2/models/shopping_list_item_model.dart';
import 'package:lista_2/widgets/single_list_item_widget.dart';
import 'package:provider/provider.dart';

import '../helpers/db_helper.dart';

class Items with ChangeNotifier {
  List<ShoppingListItem> dbItems = [];
  List<ShoppingListItem> _items = [];
  List<ShoppingListItem> get items {
    return _items;
  }

  Future<void> setAndFetchItems() async {
    final response = await DbHelper.instance.items();
    //print(response);
    _items = response
        .map((e) => ShoppingListItem(id: e.id, productName: e.productName))
        .toList();
    //_items.addAll(response);
    notifyListeners();
  }

  Map<String, dynamic> toMap(
    int id,
    String productName,
    String? productType,
    int? quantity,
    double? weight,
  ) {
    return {
      '_id': id,
      'name': productName,
      'quantity': quantity,
      'weight': weight,
      'type': productType
    };
  }
}
