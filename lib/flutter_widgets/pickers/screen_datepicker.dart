import 'package:flutter/material.dart';

import 'date_picker.dart';

class ScreenDatepicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom DatePicker Example")),
      body: Center(
        child: Column(
          children: [
            // iOS style DatePicker
            PlatformDatePicker(
              useIOS: true,   // 👈 forcefully iOS
              isDarkTheme: false,
            ),
            const SizedBox(height: 30),

            // Android style DatePicker
            PlatformDatePicker(
              useIOS: false,
              isDarkTheme: true,
            ),
          ],
        ),
      ),
    );
  }
}
