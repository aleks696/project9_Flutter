import 'package:flutter/material.dart';
import 'package:project9_/widgets/list_tile.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const FloatingActionButtonWidget({
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: ListTileWidget(
            title: 'Red',
            onTap: () {
              onTap(1);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Red button pressed'),
              ));
              Navigator.pushNamed(context, '/red_pill');
            },
            startColor: Colors.white,
            endColor: Colors.red,
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTileWidget(
            title: 'Blue',
            onTap: () {
              onTap(2);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Blue button pressed'),
              ));
              Navigator.pushNamed(context, '/blue_pill');
            },
            startColor: Colors.black,
            endColor: Colors.blue,
          ),
        ),
      ],
      onSelected: (value) {
      },
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.circle, color: Colors.red),
                    title: Text('Red'),
                    onTap: () {
                      onTap(1);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Red button pressed'),
                      ));
                      Navigator.pushNamed(context, '/red_pill');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.circle, color: Colors.blue),
                    title: Text('Blue'),
                    onTap: () {
                      onTap(2);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Blue button pressed'),
                      ));
                      Navigator.pushNamed(context, '/blue_pill');
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
