import 'package:flutter/material.dart';

class CustomButtonsDemo extends StatelessWidget {
  const CustomButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Buttons Demo")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // =====================GestureDetector
            GestureDetector(
              onTap: () => print("GestureDetector Button tapped"),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(4, 6),
                    )
                  ],
                ),
                child: const Text(
                  "Gradient Gesture Button",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= InkWell button
            InkWell(
              borderRadius: BorderRadius.circular(40),
              splashColor: Colors.orangeAccent,
              onTap: () => print("InkWell circle tapped"),
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
                child: const Icon(Icons.star, color: Colors.white, size: 30),
              ),
            ),

            const SizedBox(height: 20),

            //============= TextButton
            TextButton(
              onPressed: () => print("Custom TextButton pressed"),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                foregroundColor: Colors.teal,
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.teal, width: 2),
                ),
              ),
              child: const Text("Custom TextButton"),
            ),

            const SizedBox(height: 20),

            // =========== IconButton
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () => print("Custom IconButton pressed"),
                icon: const Icon(Icons.thumb_up),
                color: Colors.white,
                iconSize: 30,
                tooltip: "Like",
              ),
            ),

            const SizedBox(height: 20),

            // =========== ElevatedButton
            ElevatedButton(
              onPressed: () => print(" ElevatedButton pressed"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 12,
                shadowColor: Colors.grey.shade400,
              ),
              child: const Text("Button"),
            ),
          ],
        ),
      ),
    );
  }
}
