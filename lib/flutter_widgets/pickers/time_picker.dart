import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? selectedTime;

  _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TimePicker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selectedTime == null
                ? "No Time Selected"
                : "Selected: ${selectedTime!.format(context)}"),
            ElevatedButton(
              onPressed: _pickTime,
              child: Text("Pick Time"),
            ),
          ],
        ),
      ),
    );
  }
}
