import 'package:flutter/material.dart';

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
          Container(
            color: Colors.blueGrey,
            height: height / 2,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => Card(
                child: Text('moja lista nr $index'),
              ),
            ),
          ),
          Center(
              child: Container(
                  width: 250,
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
                  )))
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
