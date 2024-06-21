// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';

class EventPage extends StatefulWidget {
  final String title;
  final String image;

  const EventPage({super.key, required this.title, required this.image});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  var description;
  var date;
  var time;

  @override
  void initState() {
    super.initState();
    loadDescription();
    loadDate();
    loadTime();
  }

  void loadDescription() {
    // Here call the backend to get the description
    description = 'Yo this event is so lit brah if I were the event people I would tots put a description here like no cap brah';
  }

  void loadDate() {
    // Here call the backend to get the date (and then format it as a string in the below format)
    date = 'XX/XX/20XX';
  }

  void loadTime() {
    // Here call the backend to get the time (and then format it as a string in the below format)
    time = 'xx:xx am - xx:xx pm';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>  HomePage())
                );
              },
            );
          },
        ),
      ),
      body: Padding(
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
                )
              ),
            ), 
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(date, textAlign: TextAlign.center, style: TextStyle(
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
        ])
      ),
    );
  }
}
