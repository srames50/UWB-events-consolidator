import 'package:flutter/material.dart';
import 'package:frontend/pages/adminedit.dart';
//NA

class EventEdit extends StatefulWidget {
  const EventEdit({Key? key}) : super(key: key);

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  String _title = "Select Event";

  String _selectedEventName = 'Select Event To Edit';
  String _eventImage =
      'https://www.investopedia.com/thmb/_EUeiZWojyM4VEYLSfQ5AMbrzf4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1503239849-0dc8617d35594774b51c998694997431.jpg';
  String _description =
      "Yo this event is so lit brah if I were the event people I would tots put a description here like no cap brah";
  String _startDate = "2024-06-09";
  String _endDate = "2024-06-15";
  String _startTime = "08:30:00";
  String _endTime = "12:00:00";

  List<String> _events = [
    'Month, Day: Event 1',
    'Month, Day: Event 2',
    'Month, Day: Event 3',
    'Month, Day: Event 4',
    'Month, Day: Event 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
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
                ],
              ),
            ),
            SizedBox(
              height: 295,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  final eventName = _events[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              eventName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    AdminEventEdit(eventName: eventName),
                              ),
                            );
                          },
                          child: Icon(Icons.check_box_outlined),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          mini: true,
                        ),
                      ],
                    ),
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
