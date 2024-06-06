import 'package:flutter/material.dart';

class EventEdit extends StatefulWidget {
  const EventEdit({super.key});

  @override
  State<EventEdit> createState() => _EventEditState();
}

class _EventEditState extends State<EventEdit> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String _selectedEvent =
      'Tap To Select Event To Edit'; // Text of title/pop up button
  // ignore: prefer_final_fields
  String _eventImage =
      'https://www.investopedia.com/thmb/_EUeiZWojyM4VEYLSfQ5AMbrzf4=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1503239849-0dc8617d35594774b51c998694997431.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PopupMenuButton<String>(
          //Creates pop up buttton
          child: Center(
            child: Text(
              _selectedEvent,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          onSelected: (String value) {
            // Changes values when clicked.
            setState(() {
              _selectedEvent = 'Editing $value';
            });
          },
          itemBuilder: (context) {
            return List.generate(5, (index) {
              // Creates events will be replaced by actual user events
              return PopupMenuItem<String>(
                value: 'Event $index',
                child: Text('Event $index'),
              );
            });
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 10.0,
              right: 20.0,
              bottom: 10.0,
            ),
            child: ElevatedButton(
              onPressed: () async {
                final name = await openDialog();
                if (name == null || name.isEmpty) return;
                setState(() => this._eventImage = name);
                _eventImage = controller.text;
                print(_eventImage);
                // Replace with Pop UP
            
              },
              child: const Text(
                "Edit Image",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            // Image of the event will be replaced by actual Image of event
            padding: const EdgeInsets.all(10),
            child: Image(
              image: NetworkImage(_eventImage),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 125.0,
              top: 10.0,
              right: 125.0,
              bottom: 10.0,
            ),
            child: Text(
              "Tap to Edit Date and Time!",
              style: const TextStyle(
                fontSize: 17,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
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
          ),
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
              // SAVE EVENT WITH POST REQUEST
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("New Image"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "Enter image URL"),
            controller: controller,
          ),
          actions: [
            TextButton(onPressed: submitImage, child: const Text("SAVE"))
          ],
        ),
      );

  void submitImage() {
    Navigator.of(context).pop(controller.text);
  }
}
