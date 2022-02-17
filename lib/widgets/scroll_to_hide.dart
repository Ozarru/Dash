import 'package:flutter/material.dart';

class ScrollToHideWidget extends StatefulWidget {
  const ScrollToHideWidget(
      {Key? key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 200)})
      : super(key: key);

  final Widget child;
  final ScrollController controller;
  final Duration duration;

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) => AnimatedContainer(
      height: isVisible ? kBottomNavigationBarHeight : 0,
      duration: widget.duration,
      child: Wrap(children: [widget.child]));
}
