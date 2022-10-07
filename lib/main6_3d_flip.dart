import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(My3Dflip());
}

class My3Dflip extends StatefulWidget {
  const My3Dflip({Key? key}) : super(key: key);

  @override
  State<My3Dflip> createState() => _My3DflipState();
}

class _My3DflipState extends State<My3Dflip>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animation.addStatusListener((status) {
      _animationStatus = status;
    });
    _animation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("3D Flip")),
        ),
        body: Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.02)
              ..rotateX(3.14 * _animation.value),
            child: Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(
                top:  _animation.value,
                left: 125,
              ),
              color: Colors.blue,
              child: Icon(
                Icons.accessibility_new_outlined,
                size: 100,)
              ),
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_animationStatus == AnimationStatus.completed) {
              _animationController.reverse();
            }else if(_animationStatus == AnimationStatus.dismissed){
            _animationController.forward();
            }
          },
          child: Icon(Icons.play_arrow),
        ),
        ),
    );
  }
}
