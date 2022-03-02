import 'package:flutter/material.dart';
import 'package:lista_2/widgets/list_of_tables_generator.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);
  static const routeName = '/main_screen_page';

  @override
  Widget build(BuildContext context) {
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
                child: Card(
                  color: Colors.blue,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          )
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
