import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyYurak());
}

class MyYurak extends StatefulWidget {
  const MyYurak({Key? key}) : super(key: key);

  @override
  State<MyYurak> createState() => _MyYurakState();
}

class _MyYurakState extends State<MyYurak> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late Animation<double> _rotateAnimation;
  late Animation<Size> _slideAnimation;
  late Animation<double> _opacityAnimation;
  bool setLokol = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    
    _animation = Tween<Size>(
      begin: Size(100, 100),
      end: Size(400, 400),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut),
    );

     _rotateAnimation = Tween(begin: 0.0, end: 0.15).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.bounceInOut)));

    _slideAnimation = Tween<Size>(begin: Size(75,100), end: Size(200,600)).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
   
    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.repeat(reverse: true);
    //   }
      // else if(status == AnimationStatus.dismissed){
      //   _animationController.forward();
      // }
    // });
    //   }else {
    //     _animationController.stop();
    //   }
    //  });
    //  _animation.addListener(() { 
    //   setState(() {
        
    //   });
    //  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Onajonm",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "Peralta"),)),
        ),
        body: setLokol
          ?AnimatedBuilder(
                animation: _animation,
                builder: (context,child){
                  return Center(
                    child: SizedBox(
                      height: _animation.value.height,
                      width: _animation.value.width,
                      child: Image.asset("assets/images/yurak.jpg"),
                    ),
                  );
                },
              )
            :AnimatedBuilder(
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
                    "Sizi Yaxshi Kuraman",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color:Color .fromRGBO(0, 0, 128, _opacityAnimation.value)),
                  )),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              setLokol = !setLokol;
            });
            _animationController.repeat(reverse: true); 
            // setState(() {
            //   setLokol 
            //   ?_animationController.forward()
            //   :_animationController.stop();
            //   setLokol = !setLokol;
            // });
            // _animationController.forward();
          },
          child: setLokol
              ?Icon(Icons.play_arrow)
              :Icon(Icons.stop_circle_outlined,color: Colors.red,),
        ),
      ),
    );
  }
}
