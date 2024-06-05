import 'dart:ffi';

import 'package:flutter/material.dart';

class EventEdit extends StatefulWidget {
  const EventEdit({super.key});

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  String selectedEvent = "No Event Selected";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tap To Select Event To Edit',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/6c40/33a1/5787671f296700628b46706e5cb7c6dc?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OXrdutQ4fnSYtkjE~MRmOQCJh1lMG-D8BkcQDq7W~R2Ra1Ijy8HbX6ElcJSYCoxfL1sRErDcqS7ihSrKg42qMkzssgW3Gt3zZey0bCp-hC2pnEsBEDoWsmT-jJheotQH4Sr~hRgG5QaMLE3YPv2Tci961-Vcqz~WcdJGQGUNv5vaL40u6y5-JyCJxRX93xreSb6Nay~FEiEDTrdLNPf9BhIZ3AnDbFRSPBQXD7iHTTgxx0f7xxjNWu8iYf88uAxc4~AkVpHZ66tFIrQGxB0rKMQnUe32K2lR5yK8eIMamOWjgEpp8gWCqicq-~LOUrwjPZplvY3Z7fcp1Ncjj4O~ow__"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 125.0,
                top: 10.0,
                right: 125.0,
                bottom: 10.0,
              ),
              child: Text(
                "Tap to Edit Date and Time!",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                top: 10.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: Text(
                "Tap to Edit Description",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
            )

          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Tap to save changes!",
              style: TextStyle(fontSize: 17, fontFamily: 'Inter'),
            ),
            const SizedBox(width: 15),
            FloatingActionButton(
              onPressed: () {
                //SAVE EVENT WITH POST REQUEST
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            )
          ],
        ));
  }
}
