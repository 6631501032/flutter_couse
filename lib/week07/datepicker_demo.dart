import 'package:flutter/material.dart';

class DatepickerDemo extends StatefulWidget {
  const DatepickerDemo({super.key});

  @override
  State<DatepickerDemo> createState() => _DatepickerDemoState();
}

class _DatepickerDemoState extends State<DatepickerDemo> {
  String date = '';
  String time = '';

  void showCalendar() async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year, 9, 1),
      lastDate: DateTime(2025, 10, 31),
    );
    // if (dt != null) {
    //   setState(() {
    //     date = '${dt.day}/${dt.month}/${dt.year}';
    //   });
    // } else {
    //   setState(() {
    //     date = 'Please select a date';
    //   });
    // }
    setState(() {
      date = dt != null
          ? '${dt.day}/${dt.month}/${dt.year}'
          : 'Please select a date';
    });
  }

  void showTime() async {
    TimeOfDay? td = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      time = td != null ? '${td.hour}:${td.minute}' : 'Please select a date';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(date),
            FilledButton.icon(
              onPressed: showCalendar,
              icon: Icon(Icons.calendar_today),
              label: Text('Select'),
            ),
            SizedBox(height: 30),
            Text(time),
            FilledButton.icon(
              onPressed: showTime,
              icon: Icon(Icons.access_time),
              label: Text('Select'),
            ),
          ],
        ),
      ),
    );
  }
}
