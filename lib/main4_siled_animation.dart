import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MySiled());
}

class MySiled extends StatefulWidget {
  const MySiled({Key? key}) : super(key: key);

  @override
  State<MySiled> createState() => _MySiledState();
}

class _MySiledState extends State<MySiled> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool setLokol = true;
  double x = Random().nextDouble();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0.5, 1))
        .animate(CurvedAnimation(
            parent: _animationController, curve: setLokol? Curves.easeIn: Curves.bounceOut));
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == null) {
        _animationController.repeat(reverse: true);
        _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0.5, x))
        .animate(CurvedAnimation(
            parent: _animationController, curve: setLokol? Curves.easeIn: Curves.bounceIn));
        x = setLokol? (Random().nextDouble() - 1):Random().nextDouble();
       print("X = $x");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text("Siled Animation"),
          ),
        ),
        body: SlideTransition(
          position: _animation,
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/koptok.jpg"),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
            setLokol = !setLokol;
            });
            _animationController.forward(from: 0);
          },
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
