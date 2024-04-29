import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class PageWidget extends StatefulWidget {
  final String text;
  final Color color;
  final String tag; // Tag for Hero animation

  const PageWidget(this.text, this.color, this.tag);

  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Set the duration of the animation
    );

    _animation = SequenceAnimationBuilder()
      .addAnimatable(
        animatable: ColorTween(begin: Colors.transparent, end: widget.color),
        from: Duration.zero,
        to: const Duration(seconds: 1),
        tag: 'color', // Tag to identify the animation
      )
      .animate(_controller);

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _animation['color'].value, // Use the animated color
      child: Center(
        // Hero animation with additional effects
        child: Hero(
          tag: widget.tag, // Unique tag for each page
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  widget.text,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
