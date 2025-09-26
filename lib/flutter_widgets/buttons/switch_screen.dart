import 'package:flutter/material.dart';

import 'custom_switch.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Switch")),
      body: Center(
        child: CustomSwitch(
          value: isOn,
          onChanged: (val) {
            setState(() {
              isOn = val;
            });
          },
        ),
      ),
    );
  }
}
