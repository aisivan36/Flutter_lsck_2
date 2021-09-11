import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  final String title;

  const OpacityAnimation({Key? key, required this.title}) : super(key: key);

  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
