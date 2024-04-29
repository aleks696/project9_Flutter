import 'package:flutter/material.dart';
import '/widgets/page_widget.dart';
import '/widgets/animated_navigation_bar.dart';
import '/screens/drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, -1.0), // Transition up
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: 'appbar', 
          child: Text('Project 9'),
        ),
      ),
      drawer: DrawerScreen(onTap: _onItemTapped),
      body: _pages[_selectedIndex],
      floatingActionButton: SlideTransition(
        position: _animation,
        child: FloatingActionButton(
          onPressed: () {            
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChanged: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const PageWidget("Home", Color.fromARGB(255, 69, 179, 93), 'home'),
    const PageWidget("Red", Colors.red, 'red'),
    const PageWidget("Blue", Colors.blue, 'blue'),
  ];
}
