import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AdminEventCreate extends StatefulWidget {
  @override
  _AdminEventCreateState createState() => _AdminEventCreateState();
}

class _AdminEventCreateState extends State<AdminEventCreate> {
  String _eventName = "Tap to Select Event Name";
  String _eventImage = '';
  String _description = "Tap to Put Description Here";
  DateTimeRange? _selectedDateRange;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () async {
            final name = await openDialogName();
            if (name == null || name.isEmpty) return;
            setState(() => _eventName = name);
          },
          child: Text(
            _eventName,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Inter",
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () async {
                  final eventImage = await openDialogImage();
                  if (eventImage == null || eventImage.isEmpty) return;
                  setState(() => _eventImage = eventImage);
                },
                child: Container(
                  height: 360,
                  width: 360, // Fixed width
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _eventImage.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate,
                                size: 200,
                                color: Color(0xFF4B2E83),
                              ),
                              Text(
                                "Add Image",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontFamily: "Inter",
                                ),
                              ),
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(_eventImage, fit: BoxFit.cover),
                        ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                final dateRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (dateRange == null) return;

                final startTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: false),
                      child: Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Color(0xFF4B2E83),
                          colorScheme: ColorScheme.light(
                              primary: Color(0xFF4B2E83),
                              secondary: Color(0xFFB7A57A)),
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      ),
                    );
                  },
                  helpText: 'Select Start Time',
                );
                if (startTime == null) return;

                final endTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: false),
                      child: Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Color(0xFF4B2E83),
                          colorScheme: ColorScheme.light(
                              primary: Color(0xFF4B2E83),
                              secondary: Color(0xFFB7A57A)),
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      ),
                    );
                  },
                  helpText: 'Select End Time',
                );
                if (endTime == null) return;

                setState(() {
                  _selectedDateRange = dateRange;
                  _startTime = startTime;
                  _endTime = endTime;
                });
              },
              child: Text(
                _selectedDateRange == null ||
                        _startTime == null ||
                        _endTime == null
                    ? "Tap to Select Date and Time"
                    : "${DateFormat('yyyy-MM-dd').format(_selectedDateRange!.start)} - ${DateFormat('yyyy-MM-dd').format(_selectedDateRange!.end)}\nStart Time: ${_startTime!.format(context)} - End Time: ${_endTime!.format(context)}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: "Inter",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  final description = await openDialogDescription();
                  if (description == null || description.isEmpty) return;
                  setState(() => _description = description);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _description,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Inter",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () async {
              await addEvent();
            },
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              size: 50,
            ),
            backgroundColor: Color(0xFF4B2E83),
            foregroundColor: Color.fromARGB(255, 153, 115, 227),
          ),
        ],
      ),
    );
  }

  Future<void> addEvent() async {
    final String url =
        'http://128.199.8.191:8080/event/addEvent'; // Change to your IP
    try {
      final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      final DateFormat dateTimeFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");

      final startDate = dateFormat.format(_selectedDateRange!.start);
      final endDate = dateFormat.format(_selectedDateRange!.end);
      final startTime = dateTimeFormat.format(DateTime(
        _selectedDateRange!.start.year,
        _selectedDateRange!.start.month,
        _selectedDateRange!.start.day,
        _startTime!.hour,
        _startTime!.minute,
      ));
      final endTime = dateTimeFormat.format(DateTime(
        _selectedDateRange!.start.year,
        _selectedDateRange!.start.month,
        _selectedDateRange!.start.day,
        _endTime!.hour,
        _endTime!.minute,
      ));

      final body = json.encode({
        'eventName': _eventName,
        'description': _description,
        'startTime': startTime,
        'endTime': endTime,
        'startDate': startDate,
        'endDate': endDate,
        'image': _eventImage,
      });

      print("Request Body: $body");

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print("Event added successfully");
      } else {
        print("Failed to add event: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<String?> openDialogImage() {
    TextEditingController imageController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Image"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter image URL"),
          controller: imageController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(imageController.text),
            child: const Text("SAVE"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  Future<String?> openDialogDescription() {
    TextEditingController descriptionController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Description"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter description"),
          controller: descriptionController,
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop(descriptionController.text),
            child: const Text("SAVE"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  Future<String?> openDialogName() {
    TextEditingController nameController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Event Name"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter event name"),
          controller: nameController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(nameController.text),
            child: const Text("SAVE"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
