import 'package:flutter/material.dart';

class EventPageStatic extends StatelessWidget {
  final int eventId;
  String _name = "Name";
  String _image =
      "https://www.investopedia.com/thmb/_EUeiZWojyM4VEYLSfQ5AMbrzf4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1503239849-0dc8617d35594774b51c998694997431.jpg";
  String _description =
      "Yo this event is so lit brah if I were the event people I would tots put a description here like no cap brah";
  String _startDate = "2024-06-09";
  String _endDate = "2024-06-15";
  String _startTime = "08:30:00";
  String _endTime = "12:00:00";

  EventPageStatic({required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Specify the border color here
                    width: 2, // Specify the border width here
                  ),
                ),
                child: SizedBox(
                  height: Image.network(_image).height,
                  width:
                      Image.network(_image).width, // Specify the desired width
                  child: Image.network(_image),
                ),
              ),
            ),
            Text(
              "$_startDate - $_endDate",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text("$_startTime - $_endTime"),
            SizedBox(height: 20),
            // Add some space between the texts
            Text(
              _description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                
                ),
            ),
          ],
        ),
      ),
    );
  }
}
