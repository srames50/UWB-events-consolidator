import 'package:flutter/material.dart';

class AdminEventDeletePage extends StatefulWidget {
  @override
  _AdminEventDeletePageState createState() => _AdminEventDeletePageState();
}

class _AdminEventDeletePageState extends State<AdminEventDeletePage> {
  List<String> _events = [
    // hardcoded events, add backend functionality later
    'Month, day: Event 1',
    'Month, day: Event 2',
    'Month, day: Event 3',
    'Month, day: Event 4',
    'Month, day: Event 5',
  ];

  void _deleteEvent(int index) {
    setState(() {
      _events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Console', textAlign: TextAlign.center),
      ),
      body: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _events[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteEvent(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // button logic/ implementation
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
