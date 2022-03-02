import 'package:flutter/material.dart';
import 'package:lista_2/widgets/shopping_list_name_tab.dart';
import 'package:provider/provider.dart';

import '../helpers/db_helper.dart';

class TableNames extends StatelessWidget {
  const TableNames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tables = Provider.of<DbHelper>(context, listen: false);

    return FutureBuilder(
      future: tables.getAllTableNames(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Awaiting result...');
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            List<String> listoftables = snapshot.data as List<String>;
            return ListView.builder(
              itemCount: listoftables.length,
              itemBuilder: (context, index) => Card(
                color: Colors.blue,
                child: ShoppingListNameTab(
                    listName: listoftables[index].toString(),
                    listId: (index + 1).toString()),
              ),
            );
        }
        // unreachable
      },
    );
  }
}
