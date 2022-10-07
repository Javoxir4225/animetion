import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  AnimationStatus? _status;
  bool setLokol = true;
  double xMargin = 0;
  double yMargin = 0;
  int w = 0;
  int h = 0;
  double x = 0;
  double y = 0;
  double? maxHeight;
  double? maxWidth;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
      milliseconds: 1000,
      ),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    );
    _animation.addStatusListener((status) {
      _status = status;
    });
    _animation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("size: ${_animationController.value}");
    print("animation: ${_animation.value}");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Animation")),
        ),
        body: LayoutBuilder(
          builder: ((context, constraints) {
            maxHeight = constraints.maxHeight;
            maxWidth = constraints.maxWidth;
            xMargin = x + (w - x) * _animation.value;
            yMargin = y + (h - y) * _animation.value;
            return Container(
              margin: EdgeInsets.only(left: xMargin, top: yMargin),
              height: 100,
              width: 100,
              color: Colors.red,
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              setLokol = !setLokol;
              funk();
            });
          },
          child: setLokol
              ? Icon(Icons.play_arrow)
              : Icon(Icons.expand_circle_down_outlined),
        ),
      ),
    );
  }

  void funk() {
    // if (_status == null || _status == AnimationStatus.dismissed) {
      // _animationController.forward();
    // }
    if (_status == AnimationStatus.completed ||
        _status == AnimationStatus.dismissed || _status == null) {
      w = Random().nextInt(maxWidth!.toInt() - 100);
      h = Random().nextInt(maxHeight!.toInt() - 100);
      x = xMargin;
      y = yMargin;
      _animationController.forward(from: 0);
    }
    // if (_status == AnimationStatus.dismissed || _status == null) {
    //   _animationController.forward();
    // }else if(_status == AnimationStatus.completed){
    //   _animationController.reverse();
    // }
  }
}
