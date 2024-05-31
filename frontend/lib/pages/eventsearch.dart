import 'package:flutter/material.dart';
import 'package:frontend/pages/event.dart'; // Import EventPage here

// This allows the user to search for events from a predefined list and navigate to the event details page.
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
  List<String> _filteredEvents = []; // List to store filtered events based on the search query

  @override
  void initState() {
    super.initState();
    _filteredEvents = _allEvents;
  }

  // Method to filter events based on the search query
  void _filterEvents(String query) {
    List<String> filtered = _allEvents
        .where((event) => event.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredEvents = filtered; // Update the filtered events list

    });
  }

  @override
  // Builds the UI of the Event Search page
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Search input field
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterEvents, // Call the _filterEvents method to update the filtered events upon a change in the search field
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredEvents.length, // Number of filtered events
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredEvents[index]),
                    onTap: () {

                      // Navigate to the EventPage when an event is tapped
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
