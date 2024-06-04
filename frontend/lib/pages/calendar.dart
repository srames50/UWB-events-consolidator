import 'package:flutter/material.dart';
import 'package:frontend/components/drawer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:frontend/api_service.dart'; // Import your ApiService
import './event.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

Future<Map<DateTime, List<Event>>> _fetchEvents() async {
  final apiService = ApiService('http://localhost:8080');
  try {
    final data = await apiService.getAllEvents();
    final List<dynamic> jsonData = jsonDecode(data);
    Map<DateTime, List<Event>> eventsMap = {};
    for (var json in jsonData) {
      Event? event;
    try {
      event = Event.fromJson(json);
      print('Parsed event: ${event?.eventName ?? 'Unknown'} - $event'); // Include event name in debug print
    } catch (e) {
      print('Error parsing event: $e');
    }
      if (event != null && event.startDate != null && event.startTime != null) {
        DateTime fullStartDateTime = DateTime(
          event.startDate!.year,
          event.startDate!.month,
          event.startDate!.day,
          event.startTime!.hour,
          event.startTime!.minute,
        );
        if (eventsMap.containsKey(fullStartDateTime)) {
          eventsMap[fullStartDateTime]!.add(event);
        } else {
          eventsMap[fullStartDateTime] = [event];
        }
      }
    }
    print('Events map: $eventsMap'); // Debug: Print events map
    return eventsMap;
  } catch (e) {
    print('Error fetching events: $e');
    return {};
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

// This class represents the Calendar page of the application.
// It displays a calendar with events and allows the user to navigate through different dates and view events on those dates.
class _CalendarPageState extends State<CalendarPage> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  Map<DateTime, List<Event>> _events = {};

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedDay = DateTime(now.year, now.month, now.day);
    _selectedDay = _focusedDay;
    _calendarFormat = CalendarFormat.month;
    _fetchAndSetEvents();
  }

  Future<void> _fetchAndSetEvents() async {
    final events = await _fetchEvents();
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _fetchAndSetEvents(); // Refresh events when a new day is selected
              });
            },
              eventLoader: (day) => _events[day] ?? [],
            ),
            _buildEvents(),
          ],
        ),
      ),
    );
  }

Widget _buildEvents() {
  final selectedDay = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
  final events = _events[selectedDay] ?? [];

  print('Selected day: $selectedDay');
  print('Events for $selectedDay: $events');

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Events on ${DateFormat('MM/dd/yyyy').format(selectedDay)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      if (events.isNotEmpty)
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListTile(
                title: Text(event.eventName),
                subtitle: Text(event.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventPage(
                        title: event.eventName,
                        image: event.image ?? '',
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      if (events.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'No events on ${DateFormat('MM/dd/yyyy').format(selectedDay)}',
            style: TextStyle(fontSize: 16),
          ),
        ),
    ],
  );
}
}
