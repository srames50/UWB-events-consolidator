import 'package:flutter/material.dart';
import 'package:frontend/components/drawer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

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
    _events = _getEvents(); // You need to implement this method to get events
  }

  Map<DateTime, List<Event>> _getEvents() {
    // Fetch events from your data source and return them as a map
    // This is just a mock implementation
    return {
      DateTime.now().subtract(Duration(days: 1)): [
        Event('Event 1', 'Description 1', 'https://example.com/image1.jpg'),
      ],
      DateTime.now().add(Duration(days: 2)): [
        Event('Event 2', 'Description 2', 'https://example.com/image2.jpg'),
      ],
    };
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
                });
              },
              eventLoader: (day) {
                return _events[day] ?? [];
              },
            ),
            _buildEvents(),
          ],
        ),
      ),
    );
  }

  Widget _buildEvents() {
    final events = _events[_selectedDay] ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Events on ${DateFormat('MM/dd/yyyy').format(_selectedDay)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(events[index].title),
              subtitle: Text(events[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventPage(
                    title: events[index].title,
                    image: events[index].imageUrl,
                  )),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class Event {
  final String title;
  final String description;
  final String imageUrl;

  Event(this.title, this.description, this.imageUrl);
}