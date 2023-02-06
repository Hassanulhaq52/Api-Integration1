import 'package:flutter/material.dart';
import 'package:simple_api_integration/screens/covid_cases_screen.dart';
import 'package:simple_api_integration/screens/home_screen.dart';
import 'package:simple_api_integration/widgets/navigation_button.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime today = DateTime.now();

  void _onSelectedDay(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      date = today.toString().split(' ')[0];
      debugPrint(date);
    });
  }

  String? date;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Selected Day: ${today.toString().split(' ')[0]}',
            ),
            TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              selectedDayPredicate: (day) => isSameDay(day, today),
              availableGestures: AvailableGestures.all,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: today,
              onDaySelected: _onSelectedDay,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CovidCasesScreen(
                      date: date!,
                    ),
                  ),
                );
              },
              title: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
