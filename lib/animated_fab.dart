import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback onClick;
  const AnimatedFab({Key key, this.onClick, onPressed}) : super(key: key);

  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildFabCore(),
    );
  }

  Widget _buildFabCore() {
    return new FloatingActionButton(
      onPressed: widget.onClick,
      child: new Icon(Icons.filter_list),
      backgroundColor: Colors.pink,
    );
  }
}
