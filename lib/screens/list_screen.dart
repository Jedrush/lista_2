import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lista_2/providers/items_provider.dart';

import 'package:lista_2/widgets/list_of_items_generator.dart';

import '../helpers/db_helper.dart';
import '../widgets/single_list_item_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((_) {
  //     Provider.of<Items>(context, listen: false).setAndFetchItems();
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var itemsProvider = Provider.of<Items>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              height: 500,
              child: FutureBuilder(
                  future: Provider.of<Items>(context, listen: false)
                      .setAndFetchItems(),
                  builder: (ctx, snapshot) => ListView.builder(
                      itemBuilder: (context, i) => SingleListItem(
                          remove: () async {
                            DbHelper.instance.delete(itemsProvider.items[i].id);
                          },
                          productId: itemsProvider.items[i].id,
                          productName: itemsProvider.items[i].productName),
                      itemCount: itemsProvider.items.length)

                  // width: double.infinity,
                  ),
            ),
            TextButton(
                onPressed: () async {
                  int i = await DbHelper.instance.insert({
                    DbHelper.columnName: 'pieczywo',
                  });
                  // print('$i');
                },
                child: Text('insert')),
            TextButton(
                onPressed: () async {
                  List<Map<String, dynamic>> myTable =
                      await DbHelper.instance.queryAll();
                  //print(myTable);
                },
                child: Text('query')),
            TextButton(
                onPressed: () async {
                  await DbHelper.instance.update({
                    '_id': 4,
                    ' name': 'gluten',
                    'quantity': null,
                    'weight': null,
                    'type': null
                  });
                },
                child: Text('update')),
            TextButton(
                onPressed: () async {
                  DbHelper.instance.delete(5);
                },
                child: Text('delete')),
            TextButton(
                onPressed: () async {
                  DbHelper.instance.items();
                },
                child: Text('items')),
          ],
        ),
      ),
    );
  }
}
