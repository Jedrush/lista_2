import 'package:flutter/material.dart';

class ShoppingListNameTab extends StatelessWidget {
  const ShoppingListNameTab(
      {Key? key, required this.listName, required this.listId})
      : super(key: key);

  final String listName;
  final String listId;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Row(
      children: [
        CircleAvatar(
          child: Text(listId),
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
        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
      ],
    );
  }
}
