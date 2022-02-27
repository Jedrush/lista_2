import 'package:flutter/material.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.post_add_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
