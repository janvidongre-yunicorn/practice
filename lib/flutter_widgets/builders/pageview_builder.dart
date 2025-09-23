import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomPageViewDemo extends StatelessWidget {
  final List<String> titles = [
    "Welcome",
    "Discover",
    "Enjoy",
    "Flutter Rocks!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom PageView.builder")),
      body: PageView.builder(
        scrollDirection: Axis.vertical ,
        controller: PageController(viewportFraction: 0.8),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Transform.scale(
            scale: 0.95,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Center(
                child: Text(
                  titles[index],
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}








// import 'package:flutter/material.dart';
//
// class VerticalPageView extends StatelessWidget {
//   final List<String> videos = ["Video 1", "Video 2", "Video 3","Video 4", "Video 5", "Video 6",];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: videos.length,
//         itemBuilder: (context, index) {
//           return Container(
//             color: Colors.black,
//             alignment: Alignment.center,
//             child: Text(
//               videos[index],
//               style: const TextStyle(fontSize: 30, color: Colors.white),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
