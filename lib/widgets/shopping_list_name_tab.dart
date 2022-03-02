import 'package:flutter/material.dart';

class ShoppingListNameTAb extends StatelessWidget {
  const ShoppingListNameTAb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Row(
      children: [
        CircleAvatar(
          child: Text('1'),
        ),
        Card(
          color: Colors.grey,
          child: TextButton(
            child: Text('nazwa listy'),
            onPressed: () {},
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete))
      ],
    );
  }
}
