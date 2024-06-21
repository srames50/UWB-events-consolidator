import 'package:flutter/material.dart';
import 'package:frontend/pages/eventedit.dart';
import 'package:frontend/pages/adminedit.dart';
import 'package:frontend/pages/home.dart'; // Import the AdminHomePage
import 'package:frontend/pages/admin_event_delete.dart';

class AdminConsolePage extends StatefulWidget {
  const AdminConsolePage({Key? key}) : super(key: key);

  @override
  _AdminConsolePageState createState() => _AdminConsolePageState();
}

class _AdminConsolePageState extends State<AdminConsolePage> {
  bool _showButtonsOnPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Console'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            // Navigate back to the AdminHomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        isAdmin: false,
                      )),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "There's no events - Add some with the button below.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_showButtonsOnPage)
            Positioned(
              bottom: 110,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the EditEvent page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EventEdit()),
                      ).then((_) {
                        setState(() {
                          _showButtonsOnPage = false;
                        });
                      });
                    },
                    child: Text('Edit'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showButtonsOnPage = !_showButtonsOnPage;
                      });
                      // Navigate to add event page
                    },
                    child: Text('Add'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the EditEvent page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminEventDeletePage()),
                      ).then((_) {
                        setState(() {
                          _showButtonsOnPage = false;
                        });
                      });
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showButtonsOnPage = !_showButtonsOnPage;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
