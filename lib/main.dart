// import 'dart:async';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
//    double size = 0;
//    bool isForward = true;

//   @override
//   Widget build(BuildContext context) {
   
//    print("build function called with size: $size");

//     return Scaffold(
//       appBar: AppBar(

//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Container(
//           height: 100 + size,
//           width: 100 + size,
//           color: Colors.amber,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           setState(() {
//             _Funk();
//           });
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.play_arrow),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
  
//   void _Funk() {
//     if (size == 200) {
//       isForward = false;
//     }else{
//       isForward = true;
//     }
//    Timer.periodic(
//     Duration(milliseconds: 16), 
//     (timer){
//       if (isForward) {
//          if (size != 200) {
//         setState(() {
//         size += 5;
//         });
//       }else{
//       timer.cancel();
//       // size = 0;
//       }
//       }else{
//          if (size != 0) {
//         setState(() {
//         size -= 5;
//         });
//       }else{
//       timer.cancel();
//       // size = 0;
//       }
//       }
     
//     },
//     );
//   }
// }
