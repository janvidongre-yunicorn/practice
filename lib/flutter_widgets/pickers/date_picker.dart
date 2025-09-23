import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
bool _isDarkTheme =false;
  _pickDate() async {
    DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: _isDarkTheme
              ? ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(

              primary: Colors.teal,
              onPrimary: Colors.white,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.grey.shade900,
          )
              : ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: child!,
          ),

        );

      },

       context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DatePicker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selectedDate == null
                ? "No Date"
                : "selected: ${selectedDate!.toLocal()}"),
            ElevatedButton(
              onPressed: _pickDate,
              child: Text("Pick Date"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Light Theme"),
                Switch(
                  value: _isDarkTheme,
                  onChanged: (val) {
                    setState(() => _isDarkTheme = val);
                  },
                ),
                const Text("Dark Theme"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
