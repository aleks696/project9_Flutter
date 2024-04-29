import 'package:flutter/material.dart';
import 'package:project9_/widgets/list_tile.dart';

class DrawerScreen extends StatelessWidget {
  final Function(int) onTap;

  const DrawerScreen({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const SizedBox(height: 30),
          const SizedBox(
            height: 80.0,
            child: DrawerHeader(
              child: Text('Choose which you want', style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
            ),
          ),
          const SizedBox(height: 10),
          ListTileWidget(
            title: 'Red',
            onTap: () {
              onTap(1);
              Navigator.pop(context);
            }, startColor: Colors.black, endColor: Colors.red,
          ),
          const SizedBox(height: 10),
          ListTileWidget(
            title: 'Blue',
            onTap: () {
              onTap(2);
              Navigator.pop(context);
            }, startColor: Colors.black, endColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
