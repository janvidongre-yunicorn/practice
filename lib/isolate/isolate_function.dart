// ------------------- ISOLATE FUNCTION -------------------

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState()=> HomeState();
}
class HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {
    return Scaffold();

  }

}











// import "package:flutter/material.dart";
// class Isolate extends StatefulWidget{
//   @override
//   State<Isolate> createState()=> IsolateState();
//
//   }
//   class IsolateState extends State<Isolate>{
//   @override
//     Widget build(BuildContext context){
//     return Scaffold(
//
//
//     );
//   }















//import 'dart:isolate';

//void runTask(SendPort mainSendPort) async {
  // final controlPort = ReceivePort();
  // mainSendPort.send(controlPort.sendPort); // send control port back
  //
  // bool paused = false;
  //
  // controlPort.listen((msg) {
  //   if (msg == "pause") paused = true;
  //   if (msg == "resume") paused = false;
  // });
  //
  // for (int i = 1; i <= 10; i++) {
  //   while (paused) {
  //     await Future.delayed(Duration(seconds: 200));
  //   }
  //   //await Future.delayed(Duration(milliseconds: 200));
  //   mainSendPort.send(i);
  // }
  // mainSendPort.send('done');
//}