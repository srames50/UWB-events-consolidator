// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:frontend/api_service.dart';
import '../components/drawer.dart';
import './event.dart';
import './eventsearch.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import './home.dart';

Future<Event?> _fetchEvent(String jsonString, String name) async {
  // Get the json data by parsing the passed in string
  final List<dynamic> jsonData = jsonDecode(jsonString);

  // Find and return the first event that matches the given name
  return jsonData
      .map((json) => Event.fromJson(json))
      .firstWhere((event) => event.eventName == name);
}

class EventPage extends StatefulWidget {
  final String title;
  final String image;

  const EventPage({super.key, required this.title, required this.image});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String description = '';
  DateTime date = DateTime.now();
  String time = '';
  bool _isLoading = false;
  String _error = "";

  final apiService = ApiService('http://localhost:8080');

  @override
  void initState() {
    super.initState();
    loadEvent();
  }

  void loadEvent() async {
    setState(() {
      _isLoading = true;
      _error = "";
    });
    try {
      // Get the data string and pass it into fetchEvents
      final data = await apiService.getHomePageData();
      final event = await _fetchEvent(data, widget.title);
      setState(() {
        if (event != null) {
          description = event.description;
          date = event.startDate;
          final formattedStartTime = DateFormat.jm().format(event.startTime);
          final formattedEndTime = DateFormat.jm().format(event.endTime);
          time = '$formattedStartTime to $formattedEndTime';
        } else {
          _error = "Event not found";
        }
        _isLoading = false;
      });
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('M/d/yyyy');
    final formattedDate = dateFormat.format(date);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePage())
                );
              },
            );
          },
        ),
      ),
      body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 343,
                    height: 360,
                    decoration: const BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.image, 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ), 
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(formattedDate, textAlign: TextAlign.center, style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 17,
                  )),
                ),
                Text(time, textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 17,
                )),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(description, textAlign: TextAlign.center, style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 17,
                  )),
                ),
              ],
            ),
          ),
  );
}}


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