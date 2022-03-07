import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:lista_2/widgets/list_of_tables_generator.dart';
import '../helpers/db_helper.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);
  static const routeName = '/main_screen_page';

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  bool isClicked = true;
  void addTableSwitch() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  String now =
      'lista z: ' + DateFormat("dd-MM-yy hh:mm").format(DateTime.now());
  TextEditingController tableNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    initState() {
      super.initState();
    }

    tableNameController.text = now;

    var dbProvider = Provider.of<DbHelper>(
      context,
    );
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Column(
        children: [
          Card(
            child: Text('Moje listy:'),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: TableNames()),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: height / 8,
              child: isClicked
                  ? Card(
                      color: Colors.blue,
                      child: IconButton(
                          icon: Icon(
                            Icons.add_box_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () => addTableSwitch()))
                  : TextField(
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: addTableSwitch,
                        ),
                        iconColor: Colors.white,
                        labelText: 'Wprowadź nazwę',
                      ),
                      controller: tableNameController,
                    ),
            ),
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings), label: 'opcje'),
        BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_inactive), label: 'opcje 2')
      ]),
    );
  }
}
