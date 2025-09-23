import 'package:flutter/material.dart';

class AnimatedCardPage extends StatefulWidget {
  @override
  _AnimatedCardPageState createState() => _AnimatedCardPageState();
}

class _AnimatedCardPageState extends State<AnimatedCardPage> {
  bool isExpanded = false;
  bool isVisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Card")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() => isExpanded = !isExpanded);
            isVisible = !isVisible;
          },
          child:AnimatedOpacity(
            opacity: isVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 600),
            child: Card(
              elevation: 8,
              color: Colors.amber[100],
              child: ListTile(
                title: Text("Animated Card"),
                subtitle: Text("Fade In & Out"),
              ),
            ),
          ),


          /*AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: isExpanded ? 250 : 150,
            width: isExpanded ? 350 : 250,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.pink[200] : Colors.blue[200],
              borderRadius: BorderRadius.circular(isExpanded ? 30 : 15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.thumb_up_alt, size: 40, color: Colors.black54),
                SizedBox(height: 10),
                Text(
                  isExpanded ? "Expanded Card" : "Tap to Expand",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}
