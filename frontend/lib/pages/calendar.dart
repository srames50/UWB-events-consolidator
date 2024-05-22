import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/user_events.dart';
import 'package:frontend/pages/event.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF4B2E83),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 19
              )),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage())
                );
              },
            ),
            ListTile(
              title: const Text('Calendar', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 19
              )),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CalendarPage())
                );
              },
            ),
            ListTile(
              title: const Text('My Events', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 19
              )),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const UserEventsPage())
                );
              },
            ),
            // add more as necessary
          ],
        ),
      ),
      body: const Center(
        child: Text('Calendar')
      ),
    );
  }
}
