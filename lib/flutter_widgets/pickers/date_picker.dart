import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformDatePicker extends StatefulWidget {
  final bool isDarkTheme;
  final bool useIOS; // 👈 yeh tum control karogi

  const PlatformDatePicker({
    super.key,
    this.isDarkTheme = false,
    this.useIOS = false, // default Android
  });

  @override
  State<PlatformDatePicker> createState() => _PlatformDatePickerState();
}

class _PlatformDatePickerState extends State<PlatformDatePicker> {
  DateTime? selectedDate;

  void _pickDate(BuildContext context) async {
    if (widget.useIOS) {
      // ✅ Cupertino Date Picker (iOS style)
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 250,
          color: widget.isDarkTheme ? Colors.black : Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate ?? DateTime.now(),
            minimumDate: DateTime(2000),
            maximumDate: DateTime(2100),
            onDateTimeChanged: (DateTime date) {
              setState(() => selectedDate = date);
            },
          ),
        ),
      );
    } else {
      // ✅ Material Date Picker (Android style)
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: widget.isDarkTheme
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
            child: child!,
          );
        },
      );
      if (picked != null) {
        setState(() => selectedDate = picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(selectedDate == null
            ? "No Date Selected"
            : "Selected: ${selectedDate!.toLocal()}"),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _pickDate(context),
          child: Text(widget.useIOS ? "Pick iOS Date" : "Pick Android Date"),
        ),
      ],
    );
  }
}
