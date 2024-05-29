import 'package:flutter/material.dart';
import 'package:frontend/pages/event.dart'; // Import EventPage here

class EventSearchPage extends StatefulWidget {
  @override
  _EventSearchPageState createState() => _EventSearchPageState();
}

class _EventSearchPageState extends State<EventSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _allEvents = [
    'Event 1',
    'Event 2',
    'Event 3',
    'Event 4',
    'Event 5'
  ];
  List<String> _filteredEvents = [];

  @override
  void initState() {
    super.initState();
    _filteredEvents = _allEvents;
  }

  void _filterEvents(String query) {
    List<String> filtered = _allEvents
        .where((event) => event.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredEvents = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterEvents,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredEvents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredEvents[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(
                            title: _filteredEvents[index],
                            image: 'https://example.com/image_url', // Replace with actual image URL
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}