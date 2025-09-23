import 'package:flutter/material.dart';

class TextfieldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Card")),
        body: Center(
            child: TextField(
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              maxLength: 30,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                print("Typed: $value");
              },
            )
        )
    );
  }
}