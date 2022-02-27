import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista_2/helpers/db_helper.dart';
import 'package:lista_2/providers/items_provider.dart';
import 'package:lista_2/widgets/single_list_item_widget.dart';

Widget ListOfItems() {
  return ListView.builder(
      itemBuilder: (context, i) => SingleListItem(
          remove: () async {
            DbHelper.instance.delete(Items().items[i].id);
          },
          productId: Items().items[i].id,
          productName: Items().items[i].productName),
      itemCount: Items().items.length);
}
