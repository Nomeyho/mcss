import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FadeIn extends StatefulWidget {
  FadeIn({this.child, this.duration});

  final Widget child;
  final Duration duration;

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(FadeIn oldWidget) {
    if (_controller.isCompleted) {
      _controller.reset();
      _controller.forward();
    }

    super.didUpdateWidget(oldWidget);
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: widget.child,
    );
  }
}
