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
  String _description =
      "Yo this event is so lit brah if I were the event people I would tots put a description here like no cap brah";

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
          // EDIT BUTTON
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 10.0,
              right: 20.0,
              bottom: 10.0,
            ),
            child: ElevatedButton(
              //POP UP
              onPressed: () async {
                final eventImage = await openDialogImage();
                if (eventImage == null || eventImage.isEmpty) return;
                setState(() => this._eventImage = eventImage);
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
          Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 10.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: ElevatedButton(
                  onPressed: () async {
                    final description = await openDialogDescription();
                    if (description == null || description.isEmpty) return;
                    setState(() => this._description = description);
                  },
                  child: const Text(
                    "Edit Description",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              _description,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
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
              // SAVE EVENT WITH POST REQUEST
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<String?> openDialogImage() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("New Image"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "Enter image URL"),
            controller: controller,
          ),
          actions: [
            TextButton(onPressed: submitImage, child: const Text("SAVE")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"))
          ],
        ),
      );

  void submitImage() {
    Navigator.of(context).pop(controller.text);
  }

  Future<String?> openDialogDescription() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("New Description"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "Enter Description"),
            controller: controller,
          ),
          actions: [
            TextButton(onPressed: submitDescription, child: const Text("SAVE")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"))
          ],
        ),
      );

  void submitDescription() {
    Navigator.of(context).pop(controller.text);
  }
}
