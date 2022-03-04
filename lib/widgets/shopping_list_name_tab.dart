import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/db_helper.dart';

class ShoppingListNameTab extends StatelessWidget {
  const ShoppingListNameTab(
      {Key? key, required this.listName, required this.listId})
      : super(key: key);

  final String listName;
  final String listId;

  @override
  Widget build(BuildContext context) {
    var dbprovider = Provider.of<DbHelper>(
      context,
    );
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Text(listId),
          ),
        ),
        Expanded(
          child: TextButton(
            child: Text(
              listName,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
        IconButton(
            onPressed: () => dbprovider.dropTable(listName as String),
            icon: Icon(Icons.delete))
      ],
    );
  }
}
