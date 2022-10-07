import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyBounse());
}

class MyBounse extends StatefulWidget {
  const MyBounse({Key? key}) : super(key: key);

  @override
  State<MyBounse> createState() => _MyBounseState();
}

class _MyBounseState extends State<MyBounse>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation =
        Tween<double>(begin: 200, end: 10,).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceIn),
    );
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == null) {
        _animationController.repeat();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Bounse Animation")),
        ),
        body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/koptok.jpg"),
              margin: EdgeInsets.only(
                top: _animation.value, 
                left: 125
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _animationController.forward();
          },
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
