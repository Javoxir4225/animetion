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
  late Animation<Size> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween<Size>(
      begin: Size( 200, 200),
      end: Size(250, 500),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn));
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == null) {
        _animationController.repeat();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("size");
    print(_animation.value.width);
    print(_animation.value.height);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Resize Pulse")),
        ),
        body: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Center(
                child: SizedBox(
                  width: _animation.value.width,
                  height: _animation.value.height,
                  
                  child: Image.asset("assets/images/koptok.jpg"),
                ),
              );
            }),
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
