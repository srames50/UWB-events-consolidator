import 'package:flutter/material.dart';
import 'package:frontend/api_service.dart';
import 'package:frontend/pages/adminedit.dart';
import 'package:frontend/pages/eventedit.dart';
import '../components/drawer.dart';
import './event.dart';
import './eventsearch.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

// Async function that parses and filters JSON objects
Future<List<Event>> _fetchEvents(String jsonString) async {
  // Get the json data by parsing the passed in string
  final List<dynamic> jsonData = jsonDecode(jsonString);

  // now return with the output stream: map it, where only events that are not null are used, and parse it to a list
  return jsonData
      .map((json) => Event.fromJson(json))
      .where((event) => event.image != null)
      .toList();
}

// Must use links for images rather than assets - makes loading from DB a lot easier and seamless
// HomePage represents the main page of the application that has the header, a search button, and a list of featured events.
// Lines 135 and 147 needs to be updated when the database is updated with URLs rather than image links
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Event> _events = [];
  bool _isLoading = false;
  String _error = "";

  final apiService = ApiService('http://localhost:8080');

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  // method to call the API service (use try/catch to catch the error and capture it in the string)
  loadEvents() async {
    setState(() {
      _isLoading = true;
      _error = "";
    });
    try {
      // Get the data string and pass it into fetchEvents
      final data = await apiService.getHomePageData();
      final events = await _fetchEvents(data);
      setState(() {
        _events = events;
        _isLoading = false;
      });
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateFormat = DateFormat('M/d/yyyy');
    final formattedDate = dateFormat.format(now);

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
                  'New this week: $formattedDate',
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
            if (_isLoading)
              Center(child: CircularProgressIndicator())
            else if (_error.isNotEmpty)
              Center(child: Text('Error: $_error'))
            else
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  children: _events.map((event) {
                    return Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            // line below needs update
                            MaterialPageRoute(
                              builder: (context) => EventPage(
                                title: event.eventName,
                                image:
                                    'https://th-thumbnailer.cdn-si-edu.com/_sWVRSTELwK0-Ave6S4mFpxr1D0=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/25MikeReyfman_Waterfall.jpg',
                              ),
                            ),
                          );
                        },
                        child: Stack(children: [
                          Container(
                            width: 343,
                            height: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                // Line below needs update
                                image: NetworkImage(
                                    'https://th-thumbnailer.cdn-si-edu.com/_sWVRSTELwK0-Ave6S4mFpxr1D0=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/25MikeReyfman_Waterfall.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black
                                      .withOpacity(0.5), // Adjust opacity here
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
                                event.eventName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  }).toList(),
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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  height: 295,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 1',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 2',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 3',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 4',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 5',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ))
            ])
          ],
        ),
      ),
    );
  }
}

class Event {
  final int id;
  final String eventName;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime startDate;
  final DateTime endDate;
  final String? image;
  final DateTime createdAt;
  final List<dynamic> signedUpUsers;

  Event({
    required this.id,
    required this.eventName,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.createdAt,
    required this.signedUpUsers,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      eventName: json['eventName'],
      description: json['description'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
      signedUpUsers: json['signedUpUsers'],
    );
  }
}
