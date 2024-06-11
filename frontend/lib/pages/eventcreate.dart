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
                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                      child: Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Color(0xFF4B2E83),
                          colorScheme: ColorScheme.light(primary: Color(0xFF4B2E83), secondary: Color(0xFFB7A57A)),
                          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
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
                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                      child: Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Color(0xFF4B2E83),
                          colorScheme: ColorScheme.light(primary: Color(0xFF4B2E83), secondary: Color(0xFFB7A57A)),
                          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
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
                _selectedDateRange == null || _startTime == null || _endTime == null
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

  // Response body: 
  // '{
  //    "eventName":"New",
  //    "description":"Event Description",
  //    "startTime":"2024-06-01T10:00:00",
  //    "endTime":"2024-06-01T12:00:00",
  //    "startDate":"2024-06-01",
  //    "endDate":"2024-06-01",
  //    "image":"image_url"
  // }'
  Future<void> addEvent() async {
    final String url =
        'http://10.0.0.95:8080/event/addEvent'; //// CHNAGE WITH YOUR IP
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'name': _eventName,
          'description': _description,
          'startTime': _startTime.toString(),
          'endTime': _endTime.toString(),
          'startDate': _selectedDateRange?.start.toString(),
          'endDate': _selectedDateRange?.end.toString(),
        },
      );
    } catch (e) {
      print(e.toString());
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
        title: const Text("New Description"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter Description"),
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

  Future<String?> openDialogDate() {
    TextEditingController dateController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Date (yyyy-mm-dd)"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter New Date"),
          controller: dateController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(dateController.text),
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

  Future<String?> openDialogTime() {
    TextEditingController timeController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Time (hh:mm:ss)"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter New Time"),
          controller: timeController,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(timeController.text),
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
        title: const Text("New Name"),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter New Name"),
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
