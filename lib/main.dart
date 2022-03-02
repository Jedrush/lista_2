import 'package:flutter/material.dart';
import 'package:lista_2/providers/default_items_provider.dart';
import 'package:lista_2/providers/items_provider.dart';
import 'package:lista_2/screens/main_screen_page.dart';
import 'package:provider/provider.dart';

import './helpers/db_helper.dart';
//import './widgets/single_list_item_widget.dart';
import '../screens/list_screen.dart';
import './screens/shopping_list_screen.dart';
import './screens/create_new_list_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => DbHelper.instance),
    ChangeNotifierProvider(create: (ctx) => Items()),
    // ChangeNotifierProvider(create: (ctx) => DefaultAppItem())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => MainScreenPage(),
        MainScreenPage.routeName: (context) => MainScreenPage(),
        ShoppingListScreen.routeName: (ctx) => ShoppingListScreen(),
        CreateNewListScreen.routeName: (ctx) => CreateNewListScreen(),
      },
    );
  }
}
