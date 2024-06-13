import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:frontend/pages/eventedit.dart';
import '../components/drawer.dart';
import './event.dart';
import './eventsearch.dart';

// HomePage represents the main page of the application that has the header, a search button, and a list of featured events.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _events = [];

  @override
  void initState() {
    super.initState();
    fetchHomeEvents();
  }

  Future<void> fetchHomeEvents() async {
    final url = Uri.parse('http://192.168.1.3:8080/event/homeEvents');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> events = jsonDecode(response.body);
        setState(() {
          _events = events
              .map((event) => {
                    'id': event['id'],
                    'eventName': event['eventName'],
                    'startDate': event['startDate'],
                    'description': event['description'],
                    'endDate': event['endDate'],
                    'image': event['image'],
                    'createdAt': event['createdAt'],
                    'signedUpUsers': event['signedUpUsers'],
                  })
              .toList();
        });
      } else {
        print('Failed to fetch events. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching events: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eventipedia - UW Bothell',
          style: TextStyle(
            color: Color(0xFF4B2E83),
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Hamburger icon for the drawer
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              color: const Color(0xFF4B2E83),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Search Icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EventSearchPage()), // Navigate to EventSearchPage
              );
            },
            color: Color(0xFF4B2E83),
          ),
        ],
      ),
      drawer: AppDrawer(), // Drawer with navigation options
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                // New events
                child: Text(
                  'New This Week: XX/XX/20XX',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            // Featured Events displayed below
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 360,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _events.take(2).map((event) {
                    return _buildEventCard(context, event['eventName'],
                        event['image'], event['id'].toString());
                  }).toList(),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Other Events:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _events.length - 2,
                itemBuilder: (context, index) {
                  final event = _events[index + 2];
                  return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              child: Text(
                                '${event['startDate']}: ${event['eventName']}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                               print(event);
                              })));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => EventEdit()), // Navigate to EventEdit
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4B2E83),
      ),
    );
  }

  Widget _buildEventCard(
      BuildContext context, String title, String imageUrl, String eventId) {
    return Padding(
      padding: EdgeInsets.only(right: 13),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EventPage(
                title: title,
                image: imageUrl,
                eventId: eventId, // Pass the event ID to the EventPage
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              width: 343,
              height: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), // Adjust opacity here
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Container(
              width: 343,
              height: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF4B2E83)
                    .withOpacity(0.4), // Shade color with opacity
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewEvent {}

class EventPage extends StatelessWidget {
  final String title;
  final String image;
  final String eventId;

  EventPage({required this.title, required this.image, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(image),
            Text('Details for event ID: $eventId'),
          ],
        ),
      ),
    );
  }
}
