import 'package:flutter/material.dart';

class AdminEventEdit extends StatefulWidget {
  final String eventName;

  const AdminEventEdit({Key? key, required this.eventName}) : super(key: key);

  @override
  State<AdminEventEdit> createState() => _AdminEventEditState();
}

class _AdminEventEditState extends State<AdminEventEdit> {
  String _title = "Editing";

  String _selectedEventName = 'Select Event To Edit';
  String _eventImage =
      'https://www.investopedia.com/thmb/_EUeiZWojyM4VEYLSfQ5AMbrzf4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1503239849-0dc8617d35594774b51c998694997431.jpg';
  String _description =
      "Yo this event is so lit brah if I were the event people I would tots put a description here like no cap brah";
  String _startDate = "2024-06-09";
  String _endDate = "2024-06-15";
  String _startTime = "08:30:00";
  String _endTime = "12:00:00";
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.eventName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: Center(
                    child: Text(
                      _selectedEventName,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final name = await openDialogName();
                      if (name == null || name.isEmpty) return;
                      setState(() => _selectedEventName = name);
                    },
                    child: const Text(
                      "Edit Name",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final eventImage = await openDialogImage();
                if (eventImage == null || eventImage.isEmpty) return;
                setState(() => _eventImage = eventImage);
              },
              child: const Text(
                "Edit Image",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(_eventImage, height: 150, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "$_startDate - $_endDate",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final date = await openDialogDate();
                    if (date == null || date.isEmpty) return;
                    setState(() => _startDate = date);
                  },
                  child: const Text(
                    "Edit Start Date",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    final date = await openDialogDate();
                    if (date == null || date.isEmpty) return;
                    setState(() => _endDate = date);
                  },
                  child: const Text(
                    "Edit End Date",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "$_startTime - $_endTime",
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final time = await openDialogTime();
                    if (time == null || time.isEmpty) return;
                    setState(() => _startTime = time);
                  },
                  child: const Text(
                    "Edit Start Time",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    final time = await openDialogTime();
                    if (time == null || time.isEmpty) return;
                    setState(() => _endTime = time);
                  },
                  child: const Text(
                    "Edit End Time",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final description = await openDialogDescription();
                  if (description == null || description.isEmpty) return;
                  setState(() => _description = description);
                },
                child: const Text(
                  "Edit Description",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                _description,
                style: const TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Tap to save changes!",
            style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // SAVE EVENT WITH POST REQUEST
              Navigator.pop(context);
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
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
            onPressed: () => Navigator.of(context).pop(descriptionController.text),
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
