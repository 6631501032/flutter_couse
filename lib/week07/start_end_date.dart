import 'package:flutter/material.dart';

class StartEndDate extends StatefulWidget {
  const StartEndDate({super.key});

  @override
  State<StartEndDate> createState() => _StartEndDateState();
}

class _StartEndDateState extends State<StartEndDate> {
  DateTime from = DateTime(2025, 9, 30), to = DateTime(2025, 9, 30);

  showCalendar(bool pickdate) async {
    DateTime? dt = await showDatePicker(
      context: context,
      initialDate: pickdate ? from : to,
      firstDate: pickdate ? DateTime(2025, 9, 1) : from,
      lastDate: DateTime(2025, 12, 31),
    );
    if (dt != null) {
      setState(() {
        if (pickdate) {
          from = dt;
          if (from.isAfter(to)) to = from;
        } else
          to = dt;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DatePicker Demo', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: () => showCalendar(true),
                  icon: Icon(Icons.calendar_today),
                  label: Text('From'),
                ),
                SizedBox(width: 8),
                Text('${from.day}/${from.month}/${from.year}'),
              ],
            ),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: () => showCalendar(false),
                  icon: Icon(Icons.calendar_today),
                  label: Text('To'),
                ),
                SizedBox(width: 8),
                Text('${to.day}/${to.month}/${to.year}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
