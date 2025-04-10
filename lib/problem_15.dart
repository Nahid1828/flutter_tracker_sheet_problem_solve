import 'package:flutter/material.dart';

void main() {
  runApp(const DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  const DateTimePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Date & Time Picker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DateTimePickerScreen(),
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) setState(() => selectedTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    final dateText =
        selectedDate != null
            ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
            : "No date selected";
    final timeText =
        selectedTime != null
            ? selectedTime!.format(context)
            : "No time selected";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Date & Time Picker"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selected Date: $dateText",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _pickDate,
              style: _buttonStyle(),
              child: const Text("Pick Date"),
            ),
            const SizedBox(height: 30),
            Text(
              "Selected Time: $timeText",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _pickTime,
              style: _buttonStyle(),
              child: const Text("Pick Time"),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16),
    );
  }
}
