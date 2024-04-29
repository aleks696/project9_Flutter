import 'package:flutter/material.dart';

class AnimatedBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  AnimatedBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTabChanged,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Red pill',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Blue pill',
        ),
      ],
    );
  }
}
