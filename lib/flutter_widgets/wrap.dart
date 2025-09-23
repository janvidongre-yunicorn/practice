import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  @override
  State<WrapPage> createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  @override
 Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(title: Text("WRAP"),),
         body: Center(
           child: Padding(
             padding: const EdgeInsets.all(16.0),
             child: Wrap(
               spacing: 8.0,
               runSpacing: 4.0,
               children: <Widget>[
                 Chip(label: const Text('Flutter')),
                 Chip(label: const Text('Dart')),
                 Chip(label: const Text('Widgets')),
                 Chip(label: const Text('UI/UX')),
                 Chip(label: const Text('Development')),
                 Chip(label: const Text('Mobile')),
                 Chip(label: const Text('Cross-Platform')),
               ],
             ),
           ),
         ),

     );
  }
}