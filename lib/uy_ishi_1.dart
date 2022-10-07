
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyKoptok());
}

class MyKoptok extends StatefulWidget {
  const MyKoptok({Key? key}) : super(key: key);

  @override
  State<MyKoptok> createState() => _MyKoptokState();
}

class _MyKoptokState extends State<MyKoptok>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool setLokol = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1300),
    );
    _animation = Tween<double>(begin: 200, end: 600.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),
    );
    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     print(_animationController.value);
    //     _animationController.forward();
    //     print(AnimationStatus.values);
    //   }else if(status == AnimationStatus.dismissed){
    //     _animationController.reverse();
    //     print("object");
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: const Text(
            "Koptok",
            style: TextStyle(fontSize: 30, color: Colors.amber),
          )),
        ),
        body: AnimatedBuilder(
          animation: _animation,
          builder: (ctx, ch) {
            return Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(
                top: _animation.value,
                left: 125,
              ),
              child: Image.asset("assets/images/koptok.jpg"),
              
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              setLokol
                  ? _animationController.forward()
                  : _animationController.reverse();
              setLokol = !setLokol;
            });
          },
          child: setLokol
              ? Icon(
                  Icons.play_arrow,
                )
              : Icon(
                  Icons.stop_circle_outlined,
                  color: Colors.red,
                ),
        ),
      ),
    );
  }
}
