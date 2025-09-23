import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class iosCupertinoDatePicker extends StatefulWidget {
  final String label;
  const iosCupertinoDatePicker({super.key, this.label = "Select Date"});

  @override
  State<iosCupertinoDatePicker> createState() =>
      _iosCupertinoDatePickerState();
}

class _iosCupertinoDatePickerState
    extends State<iosCupertinoDatePicker> {
  DateTime? _selectedDate;
  bool mockIOS = true;

  void _pickDate() {
    if (mockIOS || (!kIsWeb && Platform.isIOS)) {

      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (_) => Container(
          height: 320,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.blue.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 15,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 50),
                  const Text(
                    "Pick a Date",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  CupertinoButton(
                    child: const Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          backgroundColor: Colors.blue),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate ?? DateTime.now(),
                  minimumYear: 2000,
                  maximumYear: 2100,
                  onDateTimeChanged: (pickedDate) {
                    setState(() => _selectedDate = pickedDate);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {

      showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      ).then((pickedDate) {
        if (pickedDate != null) setState(() => _selectedDate = pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: _selectedDate == null
              ? LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
          )
              : LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: _selectedDate == null
              ? [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(2, 2),
            )
          ]
              : [
            BoxShadow(
              color: Colors.blue.shade200,
              blurRadius: 10,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                gradient: _selectedDate == null
                    ? null
                    : LinearGradient(
                  colors: [Colors.blue.shade200, Colors.blue.shade100],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _selectedDate == null
                    ? widget.label
                    : " ${_selectedDate!.toLocal().toString().split(' ')[0]}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: _selectedDate == null
                      ? FontWeight.w500
                      : FontWeight.bold,
                  color: _selectedDate == null
                      ? Colors.black87
                      : Colors.blueAccent,
                ),
              ),
            ),
            Icon(
              CupertinoIcons.calendar,
              color: _selectedDate == null ? Colors.grey : Colors.blueAccent,
              size: _selectedDate == null ? 24 : 28,
            ),
          ],
        ),
      ),
    );
  }
}

