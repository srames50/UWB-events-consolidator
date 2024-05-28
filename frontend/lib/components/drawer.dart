import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/calendar.dart';
import 'package:frontend/pages/user_events.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget build(BuildContext context) {
    return Drawer(
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
                  MaterialPageRoute(builder: (context) => UserEventsPage())
                );
              },
            ),
          ],
        ),
      );
  }
}