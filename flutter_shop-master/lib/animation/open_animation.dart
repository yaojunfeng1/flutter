import 'dart:math';

import 'package:flutter/material.dart';
import '../pages/index_page.dart';

class OpenAnimation extends StatefulWidget {
  @override
  _OpenAnimationState createState() => _OpenAnimationState();
}

class _OpenAnimationState extends State<OpenAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  List girlList = [
    'https://p1-tt.byteimg.com/origin/pgc-image/b763f89b8f254a098cf245200d2a8f00?from=pc',
    'https://p3-tt.byteimg.com/origin/pgc-image/f99ba83872564d388e9dfa623385ef7c?from=pc',
    'https://p6-tt.byteimg.com/origin/pgc-image/20493d6cccf64e469c0c8e6ea7c629a0?from=pc'
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
        seconds: 3,
      ),
      vsync: this,
    );
    _animation = Tween(begin: 0, end: 1).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return IndexPage();
        }), (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var girlRan = Random().nextInt(3);
    return FadeTransition(
      opacity: _controller,
      child: Image.network(
        girlList[girlRan],
        fit: BoxFit.cover,
      ),
    );
  }
}
