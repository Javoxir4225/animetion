import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyHinge());
}

class MyHinge extends StatefulWidget {
  const MyHinge({Key? key}) : super(key: key);

  @override
  State<MyHinge> createState() => _MyHingeState();
}

class _MyHingeState extends State<MyHinge> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  late Animation<Size> _slideAnimation;
  late Animation<double> _opacityAnimation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    _animationController.addStatusListener((status) { 
      _status = status;
    });

    _rotateAnimation = Tween(begin: 0.0, end: 0.15).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.bounceInOut)));

    _slideAnimation = Tween<Size>(begin: Size(75,100), end: Size(200,600)).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Hinge Animation")),
        ),
        body: AnimatedBuilder(
            animation: _slideAnimation,
            builder: (
              ctx,
              ch,
            ) {
              return Container(
                width: 220,
                height: 100,
                margin: EdgeInsets.only(
                  top: _slideAnimation.value.height,
                  left: _slideAnimation.value.width,
                ),
                child: RotationTransition(
                  turns: _rotateAnimation,
                  child: Center(
                      child: Text(
                    "Animation",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color:Color .fromRGBO(0, 0, 128, _opacityAnimation.value)),
                  )),
                ),
              );
            }),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if (_status == AnimationStatus.completed) {
                  _animationController.reverse();
                }else if(_status == AnimationStatus.dismissed){
                _animationController.forward();
                }
              },
              child: Icon(Icons.play_arrow),
            ),
      ),
    );
  }
}
