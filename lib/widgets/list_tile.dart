import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  final String title;
  final Color startColor;
  final Color endColor;
  final VoidCallback onTap;

  const ListTileWidget({
    required this.title,
    required this.startColor,
    required this.endColor,
    required this.onTap,
  });

  @override
  _ListTileWidgetState createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _colorAnimation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return ListTile(
          title: Text(
            widget.title,
            style: TextStyle(color: _colorAnimation.value),
          ),
          tileColor: widget.endColor,
          onTap: () {
            widget.onTap();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
