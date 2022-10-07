
import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyUyIshhi());
}
class MyUyIshhi extends StatefulWidget {
  const MyUyIshhi({Key? key}) : super(key: key);

  @override
  State<MyUyIshhi> createState() => _MyUyIshhiState();
}

class _MyUyIshhiState extends State<MyUyIshhi> with SingleTickerProviderStateMixin{
  
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool setLokol = true;

  double x = 300;
  double y = 600;


  @override
  void initState() {
    
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      );
      _animation = Tween<double>(begin: x, end: y).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.bounceIn),);

  // _animation.addStatusListener((status) {

  //   if (status == AnimationStatus.completed) {
  //     _animationController.forward();
  //   }
  // });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Koptok")),
        ),
        body: AnimatedBuilder(
          animation: _animation,
          builder: (ctx,ch){
            return Container(
              width: 150,
              height: 150,
              child: Image.asset("assets/images/koptok.jpg"),
              margin: EdgeInsets.only(
                top:  _animation.value,
                left: 125,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _animationController.forward(from: 0);  

              _animation = Tween<double>(begin: y, end: x).animate(CurvedAnimation(
               parent: _animationController, curve: Curves.bounceIn),);            
             
              double z = Random().nextDouble()*600;
              y = x;
              x = z;
            });
            // _animationController.forward();
          },
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}