import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyWidget1());
}

class MyWidget1 extends StatefulWidget {
  const MyWidget1({Key? key}) : super(key: key);

  @override
  State<MyWidget1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget1>
    with SingleTickerProviderStateMixin {
  late AnimationController  _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeIn);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.forward(from: 0);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Flutter Animation")),
        ),
        body: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              // color: Colors.blue,
              child: Image.asset("assets/images/koptok.jpg",fit: BoxFit.cover,),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _animationController.forward();
          },
          child: Icon(Icons.play_arrow_outlined),
        ),
      ),
    );
  }
}
